#!/bin/bash
set -euo pipefail

# =============================================================================
# Script de verificación de salud del servicio de notificaciones
# =============================================================================
# Este script verifica que el servicio de notificaciones esté funcionando
# correctamente. Implementa múltiples niveles de verificación: conectividad,
# endpoints de health, y validación de dependencias externas.

# -----------------------------------------------------------------------------
# Configuración de colores y estilos
# -----------------------------------------------------------------------------
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly CYAN='\033[0;36m'
readonly BOLD='\033[1m'
readonly NC='\033[0m'

# -----------------------------------------------------------------------------
# Variables de configuración con valores por defecto
# -----------------------------------------------------------------------------
SERVICE_HOST="${NOTIFICATIONS_SERVICE_HOST:-localhost}"
SERVICE_PORT="${NOTIFICATIONS_SERVICE_PORT:-8080}"
SERVICE_PROTOCOL="${NOTIFICATIONS_SERVICE_PROTOCOL:-http}"
HEALTH_ENDPOINT="${HEALTH_ENDPOINT:-/health}"
READY_ENDPOINT="${READY_ENDPOINT:-/ready}"
METRICS_ENDPOINT="${METRICS_ENDPOINT:-/metrics}"
MAX_RETRIES="${HEALTHCHECK_MAX_RETRIES:-30}"
RETRY_INTERVAL="${HEALTHCHECK_RETRY_INTERVAL:-2}"
TIMEOUT="${HEALTHCHECK_TIMEOUT:-5}"
VERBOSE="${HEALTHCHECK_VERBOSE:-false}"

# -----------------------------------------------------------------------------
# Funciones de logging
# -----------------------------------------------------------------------------
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

log_debug() {
    if [ "$VERBOSE" = "true" ]; then
        echo -e "${CYAN}[DEBUG]${NC} $1"
    fi
}

log_header() {
    echo -e "${BOLD}$1${NC}"
}

# -----------------------------------------------------------------------------
# Validación de argumentos de entrada
# -----------------------------------------------------------------------------
validate_arguments() {
    log_debug "Validando argumentos de entrada..."
    
    if [ -z "$SERVICE_HOST" ]; then
        log_error "NOTIFICATIONS_SERVICE_HOST no puede estar vacío"
        return 1
    fi
    
    if ! [[ "$SERVICE_PORT" =~ ^[0-9]+$ ]] || [ "$SERVICE_PORT" -lt 1 ] || [ "$SERVICE_PORT" -gt 65535 ]; then
        log_error "Puerto de servicio inválido: $SERVICE_PORT"
        return 1
    fi
    
    if [ "$SERVICE_PROTOCOL" != "http" ] && [ "$SERVICE_PROTOCOL" != "https" ]; then
        log_error "Protocolo inválido: $SERVICE_PROTOCOL (debe ser http o https)"
        return 1
    fi
    
    log_debug "Argumentos validados correctamente"
    return 0
}

# -----------------------------------------------------------------------------
# Verificación de conectividad básica (TCP)
# -----------------------------------------------------------------------------
check_tcp_connectivity() {
    log_info "Verificando conectividad TCP..."
    
    if command -v nc &> /dev/null; then
        if nc -z -w "$TIMEOUT" "$SERVICE_HOST" "$SERVICE_PORT" 2>/dev/null; then
            log_success "Conexión TCP exitosa a ${SERVICE_HOST}:${SERVICE_PORT}"
            return 0
        fi
    elif command -v timeout &> /dev/null; then
        if timeout "$TIMEOUT" bash -c "echo >/dev/tcp/${SERVICE_HOST}/${SERVICE_PORT}" 2>/dev/null; then
            log_success "Conexión TCP exitosa a ${SERVICE_HOST}:${SERVICE_PORT}"
            return 0
        fi
    elif command -v curl &> /dev/null; then
        if curl -s --connect-timeout "$TIMEOUT" "${SERVICE_PROTOCOL}://${SERVICE_HOST}:${SERVICE_PORT}" >/dev/null 2>&1; then
            log_success "Conexión TCP exitosa a ${SERVICE_HOST}:${SERVICE_PORT}"
            return 0
        fi
    else
        log_warning "No se encontró nc, timeout ni curl. Omitiendo verificación TCP."
        return 0
    fi
    
    log_error "No se pudo establecer conexión TCP a ${SERVICE_HOST}:${SERVICE_PORT}"
    return 1
}

# -----------------------------------------------------------------------------
# Verificación de endpoint de health
# -----------------------------------------------------------------------------
check_health_endpoint() {
    log_info "Verificando endpoint de health: ${SERVICE_PROTOCOL}://${SERVICE_HOST}:${SERVICE_PORT}${HEALTH_ENDPOINT}"
    
    if ! command -v curl &> /dev/null; then
        log_error "curl no está instalado. No se puede verificar el endpoint de health."
        return 1
    fi
    
    local response
    local http_code
    
    response=$(curl -s -w "\n%{http_code}" \
        --connect-timeout "$TIMEOUT" \
        --max-time "$TIMEOUT" \
        "${SERVICE_PROTOCOL}://${SERVICE_HOST}:${SERVICE_PORT}${HEALTH_ENDPOINT}" 2>&1) || true
    
    http_code=$(echo "$response" | tail -n1)
    local body
    body=$(echo "$response" | sed '$d')
    
    log_debug "Código HTTP: $http_code"
    log_debug "Cuerpo de respuesta: $body"
    
    if [ "$http_code" = "200" ]; then
        log_success "Endpoint de health responde correctamente (HTTP 200)"
        
        # Verificar contenido del response si es JSON
        if command -v jq &> /dev/null && echo "$body" | jq -e . >/dev/null 2>&1; then
            local status
            status=$(echo "$body" | jq -r '.status // "unknown"' 2>/dev/null || echo "unknown")
            log_info "Estado del servicio: $status"
            
            if [ "$status" = "UP" ]; then
                log_success "Servicio en estado saludable"
                return 0
            else
                log_warning "Servicio reporta estado: $status"
                return 1
            fi
        fi
        
        return 0
    else
        log_error "Endpoint de health respondió con código: $http_code"
        return 1
    fi
}

# -----------------------------------------------------------------------------
# Verificación de endpoint de readiness
# -----------------------------------------------------------------------------
check_ready_endpoint() {
    log_info "Verificando endpoint de readiness: ${SERVICE_PROTOCOL}://${SERVICE_HOST}:${SERVICE_PORT}${READY_ENDPOINT}"
    
    if ! command -v curl &> /dev/null; then
        log_warning "curl no está instalado. Omitiendo verificación de readiness."
        return 0
    fi
    
    local response
    local http_code
    
    response=$(curl -s -w "\n%{http_code}" \
        --connect-timeout "$TIMEOUT" \
        --max-time "$TIMEOUT" \
        "${SERVICE_PROTOCOL}://${SERVICE_HOST}:${SERVICE_PORT}${READY_ENDPOINT}" 2>&1) || true
    
    http_code=$(echo "$response" | tail -n1)
    
    if [ "$http_code" = "200" ]; then
        log_success "Servicio está listo para recibir tráfico"
        return 0
    else
        log_warning "Servicio no está listo (HTTP $http_code)"
        return 1
    fi
}

# -----------------------------------------------------------------------------
# Verificación de métricas del servicio
# -----------------------------------------------------------------------------
check_metrics_endpoint() {
    log_info "Verificando endpoint de métricas: ${SERVICE_PROTOCOL}://${SERVICE_HOST}:${SERVICE_PORT}${METRICS_ENDPOINT}"
    
    if ! command -v curl &> /dev/null; then
        log_debug "curl no está instalado. Omitiendo verificación de métricas."
        return 0
    fi
    
    local response
    local http_code
    
    response=$(curl -s -w "\n%{http_code}" \
        --connect-timeout "$TIMEOUT" \
        --max-time "$TIMEOUT" \
        "${SERVICE_PROTOCOL}://${SERVICE_HOST}:${SERVICE_PORT}${METRICS_ENDPOINT}" 2>&1) || true
    
    http_code=$(echo "$response" | tail -n1)
    
    if [ "$http_code" = "200" ]; then
        log_success "Endpoint de métricas accesible"
        
        if [ "$VERBOSE" = "true" ]; then
            local body
            body=$(echo "$response" | sed '$d')
            local line_count
            line_count=$(echo "$body" | wc -l)
            log_info "Métricas disponibles: $line_count líneas"
        fi
        
        return 0
    else
        log_warning "Endpoint de métricas no accesible (HTTP $http_code)"
        return 1
    fi
}

# -----------------------------------------------------------------------------
# Reintentos con backoff exponencial
# -----------------------------------------------------------------------------
retry_with_backoff() {
    local attempt=1
    local max_attempts="$MAX_RETRIES"
    local interval="$RETRY_INTERVAL"
    
    log_info "Iniciando verificaciones con reintentos (máximo: $max_attempts)"
    
    while [ "$attempt" -le "$max_attempts" ]; do
        log_debug "Intento $attempt de $max_attempts"
        
        if validate_arguments && \
           check_tcp_connectivity && \
           check_health_endpoint; then
            
            log_success "Verificación de salud exitosa"
            return 0
        fi
        
        if [ "$attempt" -lt "$max_attempts" ]; then
            log_warning "Intento $attempt fallido. Reintentando en ${interval}s..."
            sleep "$interval"
            
            # Backoff exponencial: duplicar intervalo hasta máximo de 30 segundos
            interval=$((interval * 2))
            if [ "$interval" -gt 30 ]; then
                interval=30
            fi
        fi
        
        attempt=$((attempt + 1))
    done
    
    log_error "Fallaron todos los $max_attempts intentos de verificación"
    return 1
}

# -----------------------------------------------------------------------------
# Verificación completa del servicio
# -----------------------------------------------------------------------------
perform_full_check() {
    log_header "========================================"
    log_header "Verificación de Salud del Servicio"
    log_header "========================================"
    log_info "Host: ${SERVICE_HOST}:${SERVICE_PORT}"
    log_info "Protocolo: ${SERVICE_PROTOCOL}"
    log_info "Endpoints:"
    log_info "  - Health: ${HEALTH_ENDPOINT}"
    log_info "  - Ready: ${READY_ENDPOINT}"
    log_info "  - Metrics: ${METRICS_ENDPOINT}"
    log_info "========================================"
    
    local exit_code=0
    
    # Ejecutar verificaciones
    if ! check_tcp_connectivity; then
        exit_code=1
    fi
    
    if ! check_health_endpoint; then
        exit_code=1
    fi
    
    if ! check_ready_endpoint; then
        exit_code=1
    fi
    
    if ! check_metrics_endpoint; then
        exit_code=1
    fi
    
    return "$exit_code"
}

# -----------------------------------------------------------------------------
# Modo de uso
# -----------------------------------------------------------------------------
show_usage() {
    cat << EOF
Uso: $(basename "$0") [OPCIONES]

Opciones:
  -h, --help                    Mostrar esta ayuda
  -v, --verbose                 Modo verboso
  -H, --host HOST               Host del servicio (default: localhost)
  -p, --port PORT               Puerto del servicio (default: 8080)
  -r, --retry NUM                Número máximo de reintentos (default: 30)
  -i, --interval SEG             Intervalo entre reintentos en segundos (default: 2)
  -t, --timeout SEG              Timeout por verificación en segundos (default: 5)

Variables de entorno:
  NOTIFICATIONS_SERVICE_HOST           Host del servicio
  NOTIFICATIONS_SERVICE_PORT           Puerto del servicio
  NOTIFICATIONS_SERVICE_PROTOCOL       Protocolo (http o https)
  HEALTH_ENDPOINT                      Endpoint de health
  READY_ENDPOINT                       Endpoint de readiness
  METRICS_ENDPOINT                     Endpoint de métricas
  HEALTHCHECK_MAX_RETRIES              Número máximo de reintentos
  HEALTHCHECK_RETRY_INTERVAL           Intervalo entre reintentos
  HEALTHCHECK_TIMEOUT                  Timeout por verificación
  HEALTHCHECK_VERBOSE                  Modo verboso

Ejemplos:
  $(basename "$0")
  $(basename "$0") -H notifications.internal -p 8080
  NOTIFICATIONS_SERVICE_HOST=myhost $(basename "$0") -v
EOF
}

# -----------------------------------------------------------------------------
# Punto de entrada principal
# -----------------------------------------------------------------------------
main() {
    # Parsear argumentos
    while [ $# -gt 0 ]; do
        case "$1" in
            -h|--help)
                show_usage
                exit 0
                ;;
            -v|--verbose)
                VERBOSE="true"
                shift
                ;;
            -H|--host)
                SERVICE_HOST="$2"
                shift 2
                ;;
            -p|--port)
                SERVICE_PORT="$2"
                shift 2
                ;;
            -r|--retry)
                MAX_RETRIES="$2"
                shift 2
                ;;
            -i|--interval)
                RETRY_INTERVAL="$2"
                shift 2
                ;;
            -t|--timeout)
                TIMEOUT="$2"
                shift 2
                ;;
            *)
                log_error "Opción desconocida: $1"
                show_usage
                exit 1
                ;;
        esac
    done
    
    # Ejecutar verificación con reintentos
    if retry_with_backoff; then
        log_header "========================================"
        log_success "Healthcheck completado exitosamente"
        log_header "========================================"
        exit 0
    else
        log_header "========================================"
        log_error "Healthcheck falló"
        log_header "========================================"
        exit 1
    fi
}

main "$@"