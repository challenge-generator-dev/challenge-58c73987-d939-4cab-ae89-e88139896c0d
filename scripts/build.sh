#!/bin/bash
set -euo pipefail

# =============================================================================
# Script de construcción de imagen Docker para el servicio de notificaciones
# =============================================================================
# Este script construye la imagen Docker del servicio de notificaciones,
# la etiqueta con el hash del commit actual y la prepara para su despliegue.
# Implementa un proceso de build multi-stage para optimizar el tamaño final.

# -----------------------------------------------------------------------------
# Configuración de colores para salida
# -----------------------------------------------------------------------------
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m'

# -----------------------------------------------------------------------------
# Variables de configuración
# -----------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
IMAGE_NAME="${IMAGE_NAME:-notifications-service}"
IMAGE_REGISTRY="${IMAGE_REGISTRY:-ghcr.io}"
IMAGE_TAG="${IMAGE_TAG:-latest}"
DOCKERFILE_PATH="${DOCKERFILE_PATH:-${PROJECT_ROOT}/Dockerfile}"
CONTEXT_PATH="${CONTEXT_PATH:-${PROJECT_ROOT}}"
BUILD_ARGS="${BUILD_ARGS:-}"
PUSH_IMAGE="${PUSH_IMAGE:-false}"

# -----------------------------------------------------------------------------
# Funciones de utilidad
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

# -----------------------------------------------------------------------------
# Validaciones previas al build
# -----------------------------------------------------------------------------
validate_prerequisites() {
    log_info "Validando prerrequisitos del sistema..."
    
    if ! command -v docker &> /dev/null; then
        log_error "Docker no está instalado o no está en el PATH"
        exit 1
    fi
    
    if ! command -v docker buildx &> /dev/null; then
        log_warning "docker buildx no está disponible. Usando build estándar."
    fi
    
    if [ ! -f "$DOCKERFILE_PATH" ]; then
        log_error "Dockerfile no encontrado en: $DOCKERFILE_PATH"
        exit 1
    fi
    
    if [ ! -d "$CONTEXT_PATH" ]; then
        log_error "Contexto de build no encontrado en: $CONTEXT_PATH"
        exit 1
    fi
    
    if [ -f "${CONTEXT_PATH}/.dockerignore" ]; then
        log_info "Archivo .dockerignore encontrado"
    fi
    
    log_success "Prerrequisitos validados correctamente"
}

# -----------------------------------------------------------------------------
# Obtención de información del repositorio
# -----------------------------------------------------------------------------
gather_repo_info() {
    log_info "Recopilando información del repositorio..."
    
    if command -v git &> /dev/null && [ -d "${CONTEXT_PATH}/.git" ]; then
        GIT_COMMIT_HASH="$(git -C "$CONTEXT_PATH" rev-parse HEAD 2>/dev/null || echo "unknown")"
        GIT_BRANCH="$(git -C "$CONTEXT_PATH" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")"
        GIT_SHORT_HASH="${GIT_COMMIT_HASH:0:8}"
    else
        GIT_COMMIT_HASH="unknown"
        GIT_BRANCH="unknown"
        GIT_SHORT_HASH="unknown"
    fi
    
    export GIT_COMMIT_HASH
    export GIT_BRANCH
    export GIT_SHORT_HASH
    
    log_info "Commit: $GIT_COMMIT_HASH"
    log_info "Branch: $GIT_BRANCH"
}

# -----------------------------------------------------------------------------
# Construcción de la imagen Docker
# -----------------------------------------------------------------------------
build_docker_image() {
    log_info "Iniciando construcción de imagen Docker..."
    log_info "Imagen: $IMAGE_REGISTRY/$IMAGE_NAME:$IMAGE_TAG"
    
    local full_image_name="${IMAGE_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
    local build_timestamp
    build_timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    
    # Construcción de argumentos de build
    local build_flags=(--file "$DOCKERFILE_PATH")
    build_flags+=(--tag "$full_image_name")
    build_flags+=(--tag "${IMAGE_REGISTRY}/${IMAGE_NAME}:${GIT_SHORT_HASH}")
    build_flags+=(--build-arg "BUILD_TIMESTAMP=$build_timestamp")
    build_flags+=(--build-arg "GIT_COMMIT=$GIT_COMMIT_HASH")
    build_flags+=(--build-arg "GIT_BRANCH=$GIT_BRANCH")
    build_flags+=(--no-cache=${NO_CACHE:-false})
    
    # Agregar build args adicionales si se proporcionan
    if [ -n "$BUILD_ARGS" ]; then
        IFS=' ' read -ra ADDR <<< "$BUILD_ARGS"
        for arg in "${ADDR[@]}"; do
            build_flags+=(--build-arg "$arg")
        done
    fi
    
    # Habilitar buildkit para mejor rendimiento
    export DOCKER_BUILDKIT=1
    
    # Ejecutar build
    log_info "Ejecutando: docker build ${build_flags[*]} $CONTEXT_PATH"
    
    if docker build "${build_flags[@]}" "$CONTEXT_PATH"; then
        log_success "Imagen construida exitosamente"
        log_info "Etiquetas creadas:"
        echo "  - $full_image_name"
        echo "  - ${IMAGE_REGISTRY}/${IMAGE_NAME}:${GIT_SHORT_HASH}"
    else
        log_error "Error al construir la imagen Docker"
        exit 1
    fi
}

# -----------------------------------------------------------------------------
# Escaneo de vulnerabilidades con Trivy
# -----------------------------------------------------------------------------
scan_image_vulnerabilities() {
    local image_to_scan="${IMAGE_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
    
    if [ "${ENABLE_TRIVY_SCAN:-true}" = "false" ]; then
        log_warning "Escaneo de vulnerabilidades deshabilitado"
        return 0
    fi
    
    log_info "Iniciando escaneo de vulnerabilidades con Trivy..."
    
    if ! command -v trivy &> /dev/null; then
        log_warning "Trivy no está instalado. Omitiendo escaneo."
        log_warning "Para instalar: https://aquasecurity.github.io/trivy/"
        return 0
    fi
    
    local trivy_db_dir="${HOME}/.cache/trivy"
    local severity_threshold="${TRIVY_SEVERITY_THRESHOLD:-HIGH,CRITICAL}"
    
    # Actualizar base de datos de vulnerabilidades
    log_info "Actualizando base de datos de Trivy..."
    trivy image --download-db-only --db-dir "$trivy_db_dir" 2>/dev/null || true
    
    # Ejecutar escaneo
    log_info "Escaneando imagen: $image_to_scan"
    
    local trivy_exit_code=0
    trivy image \
        --severity "$severity_threshold" \
        --db-dir "$trivy_db_dir" \
        --format json \
        --output "${PROJECT_ROOT}/trivy-scan-results.json" \
        "$image_to_scan" || trivy_exit_code=$?
    
    # Analizar resultados
    if [ $trivy_exit_code -eq 0 ]; then
        log_success "No se encontraron vulnerabilidades críticas"
    elif [ $trivy_exit_code -eq 1 ]; then
        log_error "Se encontraron vulnerabilidades en la imagen"
        cat "${PROJECT_ROOT}/trivy-scan-results.json" | head -50 || true
        
        if [ "${FAIL_ON_VULNERABILITIES:-true}" = "true" ]; then
            log_error "Build fallido debido a vulnerabilidades críticas"
            exit 1
        fi
    else
        log_warning "Error al ejecutar escaneo de Trivy (código: $trivy_exit_code)"
    fi
}

# -----------------------------------------------------------------------------
# Publicación de la imagen
# -----------------------------------------------------------------------------
publish_image() {
    if [ "$PUSH_IMAGE" = "false" ]; then
        log_info "Publicación de imagen deshabilitada (PUSH_IMAGE=false)"
        return 0
    fi
    
    log_info "Publicando imagen en el registro..."
    
    local full_image_name="${IMAGE_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
    
    if docker push "$full_image_name"; then
        log_success "Imagen publicada exitosamente"
    else
        log_error "Error al publicar la imagen"
        exit 1
    fi
    
    # También etiquetar como latest si no es already latest
    if [ "$IMAGE_TAG" != "latest" ]; then
        docker tag "$full_image_name" "${IMAGE_REGISTRY}/${IMAGE_NAME}:latest"
        docker push "${IMAGE_REGISTRY}/${IMAGE_NAME}:latest"
    fi
}

# -----------------------------------------------------------------------------
# Limpieza de recursos
# -----------------------------------------------------------------------------
cleanup() {
    log_info "Limpiando recursos temporales..."
    
    # Eliminar imágenes intermedias (build cache)
    if [ "${CLEANUP_BUILD_CACHE:-true}" = "true" ]; then
        docker builder prune -f --filter "until=24h" 2>/dev/null || true
    fi
    
    log_success "Limpieza completada"
}

# -----------------------------------------------------------------------------
# Punto de entrada principal
# -----------------------------------------------------------------------------
main() {
    log_info "=========================================="
    log_info "Script de Build - Servicio de Notificaciones"
    log_info "=========================================="
    
    validate_prerequisites
    gather_repo_info
    build_docker_image
    scan_image_vulnerabilities
    publish_image
    cleanup
    
    log_success "=========================================="
    log_success "Build completado exitosamente"
    log_success "=========================================="
}

main "$@"