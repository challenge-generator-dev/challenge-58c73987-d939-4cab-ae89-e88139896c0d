# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/notifications_service/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/notifications_service/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/notifications_service/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Como saber que terminaste

```bash
docker build -t reto:local . && terraform init -backend=false && terraform validate
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter DevOps, Especialidad Ingenieria, Tecnología Terraform, Advanced

### Brecha de conocimiento
Utiliza infraestructura como codigo e integra escaneo de dependencias y de imagenes en el pipeline

### Misión / candidato
Versionar la infraestructura del servicio de notificaciones

### Datos adicionales
Candidato con 3 años en DevOps

### Reto
- Tema: Infraestructura como codigo y seguridad de la cadena
- Seniority: advanced-l2
- Tipo: practical
- Título: Implementación de Infraestructura como Código con Terraform y Escáner de Seguridad
- Tiempo estimado: 10 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Definición y versionado de la infraestructura — objetivo: Crear y versionar la infraestructura del servicio de notificaciones utilizando Terraform. — entregable (NO resolver): Archivos de Terraform que definen la infraestructura del servicio de notificaciones, versionados en un repositorio.
- Fase 2: Integración de escaneo de dependencias y de imágenes — objetivo: Integrar un escaneo de dependencias y de imágenes en el pipeline de CI/CD. — entregable (NO resolver): Pipeline de CI/CD configurado para integrar el escaneo de dependencias y de imágenes, con criterios de aceptación establecidos.
- Fase 3: Validación y optimización del pipeline — objetivo: Validar y optimizar el pipeline de CI/CD para asegurar la eficiencia y la seguridad. — entregable (NO resolver): Pipeline de CI/CD validado y optimizado, con todas las vulnerabilidades corregidas.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: variables.tf ===
# Variables globales para la configuración de Terraform
# Estas variables se utilizan en los archivos main.tf y outputs.tf

variable "aws_region" {
  description = "Región de AWS donde se desplegará la infraestructura"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue (dev, prod, etc.)"
  type        = string
}

variable "service_name" {
  description = "Nombre del servicio de notificaciones"
  type        = string
  default     = "notifications-service"
}

variable "vpc_id" {
  description = "ID del VPC donde se desplegará el servicio"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de IDs de subnets para el despliegue del servicio"
  type        = list(string)
}

variable "ecs_cluster_name" {
  description = "Nombre del clúster ECS donde se desplegará el servicio"
  type        = string
}

variable "ecs_task_cpu" {
  description = "Cantidad de CPU asignada a la tarea ECS"
  type        = number
  default     = 256
}

variable "ecs_task_memory" {
  description = "Cantidad de memoria asignada a la tarea ECS"
  type        = number
  default     = 512
}

variable "ecs_task_desired_count" {
  description = "Número deseado de tareas ECS en ejecución"
  type        = number
  default     = 1
}

variable "ecs_task_execution_role_arn" {
  description = "ARN del rol de ejecución para la tarea ECS"
  type        = string
}

variable "ecs_task_container_image" {
  description = "URI de la imagen Docker para el contenedor ECS"
  type        = string
}

variable "ecs_task_container_port" {
  description = "Puerto expuesto por el contenedor ECS"
  type        = number
  default     = 8080
}

variable "alb_listener_arn" {
  description = "ARN del listener del Application Load Balancer"
  type        = string
}

variable "alb_dns_name" {
  description = "DNS name del Application Load Balancer"
  type        = string
}

variable "logs_retention_in_days" {
  description = "Número de días para retener los logs en CloudWatch"
  type        = number
  default     = 7
}

variable "sns_topic_arn" {
  description = "ARN del topic SNS para notificaciones de seguridad"
  type        = string
}

variable "security_scan_enabled" {
  description = "Habilita el escaneo de seguridad en el pipeline"
  type        = bool
  default     = true
}

// === ARCHIVO: providers.tf ===
# Configuración de proveedores para Terraform
# Define los proveedores necesarios para desplegar la infraestructura en AWS

terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configuración del proveedor AWS
provider "aws" {
  region = var.aws_region

  # Configuración para asumir un rol con permisos específicos
  assume_role {
    role_arn = "arn:aws:iam::${local.account_id}:role/terraform-execution-role"
  }

  # Configuración de tags por defecto para todos los recursos
  default_tags {
    tags = {
      Environment = var.environment
      Service     = var.service_name
      ManagedBy   = "Terraform"
    }
  }
}

# Variables locales para evitar repetición
locals {
  account_id = data.aws_caller_identity.current.account_id
}

# Data source para obtener información de la cuenta AWS actual
data "aws_caller_identity" "current" {}

# Configuración del backend para Terraform (se define en el archivo backend.tf)
# Nota: El backend se configura en un archivo separado para facilitar la gestión
# de diferentes entornos (dev, prod, etc.)

# Configuración para integrar con AWS Secrets Manager
data "aws_secretsmanager_secret_version" "ci_cd_secrets" {
  secret_id = "ci-cd/${var.environment}/secrets"
}

# Configuración para integrar con AWS CloudWatch Logs
resource "aws_cloudwatch_log_group" "service_logs" {
  name              = "/ecs/${var.service_name}-${var.environment}"
  retention_in_days = var.logs_retention_in_days

  tags = {
    Name = "${var.service_name}-logs"
  }
}

# Configuración para integrar con AWS SNS para notificaciones de seguridad
resource "aws_sns_topic_subscription" "security_notifications" {
  topic_arn = var.sns_topic_arn
  protocol  = "email"
  endpoint  = jsondecode(data.aws_secretsmanager_secret_version.ci_cd_secrets.secret_string)["security_notifications_email"]
}

// === ARCHIVO: modules/notifications_service/variables.tf ===
# Variables específicas para el módulo del servicio de notificaciones
# Estas variables se utilizan en el archivo main.tf del módulo

variable "service_name" {
  description = "Nombre del servicio de notificaciones"
  type        = string
  default     = "notifications-service"
}

variable "environment" {
  description = "Entorno de despliegue (dev, prod, etc.)"
  type        = string
}

variable "vpc_id" {
  description = "ID del VPC donde se desplegará el servicio"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de IDs de subnets para el despliegue del servicio"
  type        = list(string)
}

variable "ecs_cluster_name" {
  description = "Nombre del clúster ECS donde se desplegará el servicio"
  type        = string
}

variable "ecs_task_cpu" {
  description = "Cantidad de CPU asignada a la tarea ECS"
  type        = number
  default     = 256
}

variable "ecs_task_memory" {
  description = "Cantidad de memoria asignada a la tarea ECS"
  type        = number
  default     = 512
}

variable "ecs_task_desired_count" {
  description = "Número deseado de tareas ECS en ejecución"
  type        = number
  default     = 1
}

variable "ecs_task_execution_role_arn" {
  description = "ARN del rol de ejecución para la tarea ECS"
  type        = string
}

variable "ecs_task_container_image" {
  description = "URI de la imagen Docker para el contenedor ECS"
  type        = string
}

variable "ecs_task_container_port" {
  description = "Puerto expuesto por el contenedor ECS"
  type        = number
  default     = 8080
}

variable "alb_listener_arn" {
  description = "ARN del listener del Application Load Balancer"
  type        = string
}

variable "logs_retention_in_days" {
  description = "Número de días para retener los logs en CloudWatch"
  type        = number
  default     = 7
}

variable "notification_api_url" {
  description = "URL del servicio externo de notificaciones"
  type        = string
}

variable "notification_api_key" {
  description = "API key para autenticarse con el servicio externo de notificaciones"
  type        = string
  sensitive   = true
}

variable "security_scan_enabled" {
  description = "Habilita el escaneo de seguridad en el pipeline"
  type        = bool
  default     = true
}

// === ARCHIVO: main.tf ===
terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Proveedor AWS configurado con la región por defecto
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment
      Project     = "notifications-service"
      ManagedBy   = "terraform"
    }
  }
}

# Bucket S3 para almacenar el estado de Terraform
resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.project_name}-${var.environment}-terraform-state"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# Tabla DynamoDB para el bloqueo de estado
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "${var.project_name}-${var.environment}-terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

# VPC para el servicio de notificaciones
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.project_name}-${var.environment}-vpc"
  }
}

# Subnets públicas
resource "aws_subnet" "public" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 4, count.index)
  availability_zone = var.availability_zones[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-${var.environment}-public-subnet-${count.index + 1}"
    Type = "public"
  }
}

# Subnets privadas
resource "aws_subnet" "private" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 4, count.index + length(var.availability_zones))
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "${var.project_name}-${var.environment}-private-subnet-${count.index + 1}"
    Type = "private"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-${var.environment}-igw"
  }
}

# NAT Gateways en cada AZ
resource "aws_nat_gateway" "main" {
  count         = length(var.availability_zones)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = {
    Name = "${var.project_name}-${var.environment}-nat-${count.index + 1}"
  }

  depends_on = [aws_internet_gateway.main]
}

# Elastic IPs para NAT Gateways
resource "aws_eip" "nat" {
  count  = length(var.availability_zones)
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-${var.environment}-nat-eip-${count.index + 1}"
  }
}

# Route tables
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-public-rt"
  }
}

resource "aws_route_table" "private" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main[count.index].id
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-private-rt-${count.index + 1}"
  }
}

# Associations de route tables
resource "aws_route_table_association" "public" {
  count          = length(var.availability_zones)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = length(var.availability_zones)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}

# Security Group para el servicio de notificaciones
resource "aws_security_group" "notifications_service" {
  name        = "${var.project_name}-${var.environment}-notifications-sg"
  description = "Security group para el servicio de notificaciones"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP desde ALB"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  ingress {
    description = "Health check"
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Salida a internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-notifications-sg"
  }
}

# Security Group para RDS (MySQL)
resource "aws_security_group" "rds" {
  name        = "${var.project_name}-${var.environment}-rds-sg"
  description = "Security group para RDS MySQL"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "MySQL desdeapp"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.notifications_service.id]
  }

  egress {
    description = "Salida a internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-rds-sg"
  }
}

# RDS MySQL para el servicio de notificaciones
resource "aws_db_instance" "notifications" {
  identifier     = "${var.project_name}-${var.environment}-notifications-db"
  engine         = "mysql"
  engine_version = "8.0.35"
  instance_class = var.db_instance_class

  allocated_storage     = 20
  max_allocated_storage = 100
  storage_encrypted     = true
  storage_type          = "gp3"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name

  backup_retention_period = 7
  backup_window           = "03:00-04:00"
  maintenance_window      = "mon:04:00-mon:05:00"

  deletion_protection = var.environment == "prod" ? true : false

  skip_final_snapshot       = var.environment != "prod"
  final_snapshot_identifier = var.environment == "prod" ? "${var.project_name}-${var.environment}-final-snapshot" : null

  tags = {
    Name = "${var.project_name}-${var.environment}-notifications-db"
  }
}

# DB Subnet Group
resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-${var.environment}-db-subnet-group"
  subnet_ids = aws_subnet.private[*].id

  tags = {
    Name = "${var.project_name}-${var.environment}-db-subnet-group"
  }
}

# Application Load Balancer
resource "aws_lb" "main" {
  name               = "${var.project_name}-${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = aws_subnet.public[*].id

  enable_deletion_protection = var.environment == "prod" ? true : false

  tags = {
    Name = "${var.project_name}-${var.environment}-alb"
  }
}

# Security Group para ALB
resource "aws_security_group" "alb" {
  name        = "${var.project_name}-${var.environment}-alb-sg"
  description = "Security group para Application Load Balancer"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Salida a instancias"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-alb-sg"
  }
}

# Target Group para el servicio
resource "aws_lb_target_group" "notifications" {
  name     = "${var.project_name}-${var.environment}-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/actuator/health"
    matcher             = "200"
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-tg"
  }
}

# Listener para el ALB
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.notifications.arn
  }
}

// === ARCHIVO: outputs.tf ===
# Outputs de la VPC
output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block de la VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = aws_subnet.private[*].id
}

# Outputs de la base de datos
output "db_instance_endpoint" {
  description = "Endpoint de la instancia RDS"
  value       = aws_db_instance.notifications.endpoint
}

output "db_instance_address" {
  description = "Dirección de la instancia RDS"
  value       = aws_db_instance.notifications.address
}

output "db_instance_port" {
  description = "Puerto de la instancia RDS"
  value       = aws_db_instance.notifications.port
}

output "db_instance_name" {
  description = "Nombre de la base de datos"
  value       = aws_db_instance.notifications.db_name
}

# Outputs del Application Load Balancer
output "alb_dns_name" {
  description = "DNS name del Application Load Balancer"
  value       = aws_lb.main.dns_name
}

output "alb_arn" {
  description = "ARN del Application Load Balancer"
  value       = aws_lb.main.arn
}

output "alb_zone_id" {
  description = "Zone ID del ALB para Route53"
  value       = aws_lb.main.zone_id
}

# Outputs de los Security Groups
output "notifications_service_sg_id" {
  description = "ID del security group del servicio de notificaciones"
  value       = aws_security_group.notifications_service.id
}

output "alb_sg_id" {
  description = "ID del security group del ALB"
  value       = aws_security_group.alb.id
}

output "rds_sg_id" {
  description = "ID del security group de RDS"
  value       = aws_security_group.rds.id
}

# Outputs del Terraform state
output "terraform_state_bucket" {
  description = "Nombre del bucket S3 para el estado de Terraform"
  value       = aws_s3_bucket.terraform_state.id
}

output "terraform_locks_table" {
  description = "Nombre de la tabla DynamoDB para bloqueos"
  value       = aws_dynamodb_table.terraform_locks.name
}

# Outputs de configuración para el servicio
output "service_endpoint" {
  description = "Endpoint público del servicio de notificaciones"
  value       = "http://${aws_lb.main.dns_name}"
}

output "health_check_endpoint" {
  description = "Endpoint de health check"
  value       = "http://${aws_lb.main.dns_name}:8081/actuator/health"
}

// === ARCHIVO: Dockerfile ===
# Etapa de construcción - Build stage
FROM eclipse-temurin:17-jdk-alpine AS builder

# Instalar herramientas necesarias para build
RUN apk add --no-cache \
    maven \
    git \
    curl

# Configurar directorio de trabajo
WORKDIR /build

# Copiar primero el POM para aprovechar caché de capas
COPY pom.xml .

# Descargar dependencias
RUN mvn dependency:go-offline -B

# Copiar código fuente
COPY src ./src

# Compilar la aplicación
RUN mvn clean package -DskipTests -B

# Etapa de ejecución - Runtime stage
FROM eclipse-temurin:17-jre-alpine

# Instalar runtime necesario para la aplicación
RUN apk add --no-cache \
    curl \
    ncurses \
    bash

# Crear usuario no root para seguridad
RUN addgroup -g 1000 -S appgroup && \
    adduser -u 1000 -S appuser -G appgroup

# Crear directorio para la aplicación
RUN mkdir -p /app && \
    chown -R appuser:appgroup /app

# Cambiar a directorio de trabajo
WORKDIR /app

# Copiar el JAR construido desde la etapa de build
COPY --from=builder /build/target/notifications-service-*.jar app.jar

# Establecer permisos
RUN chown -R appuser:appgroup /app

# Cambiar a usuario no root
USER appuser

# Variables de entorno para configuración
ENV JAVA_OPTS="-Xms256m -Xmx512m -XX:+UseG1GC -XX:MaxGCPauseMillis=100 -Djava.security.egd=file:/dev/./urandom"
ENV SERVER_PORT=8080
ENV SPRING_PROFILES_ACTIVE=prod

# Exponer puertos
EXPOSE 8080 8081

# Healthcheck para verificar que la aplicación está corriendo
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:8081/actuator/health || exit 1

# Etiquetas de metadatos
LABEL maintainer="devops@fintech.company"
LABEL version="1.0.0"
LABEL description="Servicio de notificaciones para la plataforma fintech"

# Punto de entrada con JavaOpts configurables
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]

// === ARCHIVO: .dockerignore ===
# Version control
.git
.gitignore

# Terraform state and logs
*.tfstate
*.tfstate.*
*.tfvars
*.tfvars.json
.terraform/
*.log

# IDE and editor files
.vscode/
.idea/
*.swp
*.swo
*~

# OS files
.DS_Store
Thumbs.db

# Documentation (not needed in container)
*.md
docs/
README*
LICENSE

# CI/CD configuration files (not needed in container)
.github/
.gitlab-ci.yml
azure-pipelines.yml
Jenkinsfile

# Scripts (run from host, not in container)
scripts/

# Test files
*_test.go
*_test.py
test/
tests/
*.test

# Temporary files
tmp/
temp/
*.tmp

# Secrets and credentials (should never be in image)
*.pem
*.key
*.crt
credentials.json
secrets/
.env
.env.*

# Build artifacts from other platforms
target/
dist/
build/
node_modules/
"// === ARCHIVO: sonar-project.properties ===
# Configuration for SonarCloud static analysis
# Project identification
sonar.projectKey=fintech-notifications-service
sonar.organization=fintech-devops

# Project metadata
sonar.projectName=Notifications Service Infrastructure
sonar.projectVersion=1.0.0
sonar.description=Infrastructure as Code and CI/CD pipeline for Notifications Service

# Source code configuration
sonar.sources=.
sonar.exclusions=**/*.md,**/docs/**,.git/**,.github/**,scripts/**,environments/**

# Terraform analysis support
sonar.terraform.module.handling=standard
sonar.terraform.module.file.patterns=modules/**/*.tf

# Dockerfile analysis
sonar.dockerfile.filePatterns=Dockerfile

# YAML pipeline analysis
sonar.yaml.file.patterns=.github/workflows/*.yml,azure-pipelines.yml

# Code coverage (if available)
sonar.coverage.jacoco.xmlReportPaths=target/site/jacoco/jacoco.xml
sonar.coverage.reports.path=target/site/coverage/coverage.xml

# Quality gates configuration
sonar.qualitygate.wait=true
sonar.qualitygate.timeout=300

# Analysis scope
sonar.inclusions=**/*.tf,**/*.yml,**/*.yaml,**/Dockerfile
sonar.issues.console.threshold=Critical
sonar.issues.console.highThreshold=0

# Branch analysis configuration
sonar.branch.target=main
sonar.branch.name=${GITHUB_REF#refs/heads/}

# Pull request analysis
sonar.pullrequest.provider=github
sonar.pullrequest.github.repository=${GITHUB_REPOSITORY}
s
# Security and vulnerability settings
sonar.security.config.owasp=active
sonar.security.config.sast=active

# Technical debt configuration
sonar.technicalDebt.developerSquare=Legacy
sonar.technicalDebt.ratio="0.15"

# Analysis mode
sonar.analysis.mode=publish

# Additional metadata
sonar.links.homepage=https://github.com/fintech/notifications-service
sonar.links.scm=github.com/fintech/notifications-service
sonar.links.issue=https://github.com/fintech/notifications-service/issues
"// === ARCHIVO: README.md ===
# Notifications Service - Infrastructure as Code

Este proyecto contiene la definición de infraestructura como código utilizando Terraform para el servicio de notificaciones de la plataforma fintech. La infraestructura incluye la configuración de recursos AWS necesarios y un pipeline de CI/CD seguro que integra análisis estático y escaneo de vulnerabilidades.

## Arquitectura del Sistema

El servicio de notificaciones se comunica con un proveedor externo para entregar mensajes a los usuarios finales. La infraestructura está diseñada para escalar automáticamente según la demanda y mantener altos estándares de seguridad en toda la cadena de suministro.

### Componentes Principales

La infraestructura se organiza en módulos reutilizables que definen diferentes componentes del sistema:

- Módulo de notificaciones: Configura los recursos necesarios para el servicio de notificaciones incluyendo funciones Lambda, colas de mensajes y políticas de acceso.
- Pipeline de CI/CD: Automatiza el build, test, análisis de seguridad y despliegue a diferentes ambientes.
- Configuración de seguridad: Implementa escaneo de dependencias, análisis de imágenes Docker y escaneo de infraestructura como código.

## Estructura del Proyecto

```
├── .github/workflows/     # Pipeline de CI/CD con GitHub Actions
├── modules/               # Módulos reutilizables de Terraform
│   └── notifications_service/
├── environments/          # Configuración por ambiente
│   ├── dev/
│   └── prod/
├── scripts/               # Scripts de automatización
├── main.tf                # Configuración principal de Terraform
├── variables.tf           # Definición de variables
├── providers.tf           # Configuración de proveedores
├── outputs.tf             # Outputs de la infraestructura
├── Dockerfile             # Imagen Docker multi-stage
└── sonar-project.properties  # Configuración de SonarCloud
```

## Requisitos Previos

Para trabajar con este proyecto necesitas las siguientes herramientas instaladas en tu sistema:

- Terraform versión 1.5.7 o superior
- Docker versión 20.10 o superior
- AWS CLI configurado con credenciales válidas
- Git para control de versiones
- Herramientas de línea de comandos estándar (bash, curl, jq)

## Configuración Inicial

### Variables de Entorno

Configura las siguientes variables de entorno antes de ejecutar cualquier comando:

```bash
export AWS_REGION=us-east-1
export AWS_PROFILE=default
```

### Credenciales de AWS

Asegúrate de tener configuradas tus credenciales de AWS mediante uno de los métodos siguientes:

- Variables de entorno AWS_ACCESS_KEY_ID y AWS_SECRET_ACCESS_KEY
- Archivo de credenciales ~/.aws/credentials
- Roles de IAM con permisos apropiados

### Inicialización de Terraform

Para descargar los proveedores y preparar el backend de estado, ejecuta:

```bash
terraform init -backend=false
```

El flag -backend=false se usa para desarrollo local sin configurar un backend remoto. En producción, usa el backend configurado en main.tf.

## Validación de la Infraestructura

### Plan de Terraform

Para ver los cambios que se aplicarían a la infraestructura:

```bash
terraform plan -var-file=environments/dev/terraform.tfvars
```

### Validación de Sintaxis

Para validar la sintaxis de los archivos de Terraform:

```bash
terraform validate
```

### Formateo de Código

Para asegurar que el código cumple con los estándares de formato:

```bash
terraform fmt -recursive
```

## Construcción de la Imagen Docker

### Build de la Imagen

Para construir la imagen Docker del servicio:

```bash
docker build -t notifications-service:local .
```

### Verificación de la Imagen

Para verificar que la imagen se construyó correctamente:

```bash
docker run --rm notifications-service:local /app/healthcheck.sh
```

### Escaneo de Vulnerabilidades

Para escanear la imagen en busca de vulnerabilidades usando Trivy:

```bash
trivy image --severity HIGH,CRITICAL notifications-service:local
```

## Pipeline de CI/CD

### Stages del Pipeline

El pipeline de CI/CD está compuesto por los siguientes stages:

1. Build: Compila la aplicación y construye la imagen Docker.
2. Test: Ejecuta pruebas unitarias y de integración.
3. Security Scan: Realiza análisis estático con SonarCloud y escaneo de dependencias.
4. Image Scan: Escanea la imagen Docker en busca de vulnerabilidades.
5. Deploy: Despliega a los ambientes configurados según las políticas de calidad.

### Ejecución del Pipeline

El pipeline se ejecuta automáticamente cuando se realiza un push a las ramas principales o cuando se abre un pull request. También puede ejecutarse manualmente desde la interfaz de GitHub Actions.

### Gates de Calidad

El pipeline incluye gates de calidad que deben pasar antes de permitir el despliegue:

- Cobertura de código mínima: 80%
- Ninguna vulnerabilidad crítica o de alto nivel en el código
- Ninguna vulnerabilidad crítica o alta en las dependencias
- Ninguna vulnerabilidad crítica o alta en la imagen Docker
- Análisis estático sin bloqueos críticos

## Gestión de Secretos

**IMPORTANTE**: Nunca almacenes secretos en el repositorio. Usa las siguientes prácticas:

- AWS Secrets Manager para almacenar claves de API y credenciales
- Variables de entorno para configuración sensible
- GitHub Secrets para el pipeline de CI/CD
- Terraform Vault o AWS Parameter Store para secretos en tiempo de ejecución

## Despliegue a Producción

El despliegue a producción requiere:

1. Que todos los gates de calidad pasen en el ambiente de staging
2. Aprobación manual de un usuario autorizado
3. Que el escaneo de seguridad no encuentre vulnerabilidades críticas
4. Que los logs de aplicación no muestren errores críticos

## Monitoreo y Observabilidad

El servicio está configurado para exportar métricas a Prometheus y logs a CloudWatch. Los dashboards de Grafana están disponibles en el espacio de trabajo de monitoreo para visualizar el rendimiento y la salud del servicio.

## Contribución

Para contribuir al proyecto:

1. Crea una rama feature/ desde develop
2. Realiza tus cambios siguiendo las convenciones del proyecto
3. Ejecuta los scripts de validación localmente
4. Abre un pull request con los cambios
5. Espera la revisión y aprobación del equipo
6. Merge después de pasar todos los gates de calidad

## Licencia

Este proyecto es propiedad de la empresa fintech y su uso está restringido a personal autorizado.

// === ARCHIVO: modules/notifications_service/main.tf ===
# Módulo de infraestructura para el servicio de notificaciones
# Superficie de práctica: el estudiante implementará los recursos necesarios

# Stub: recursos de compute (ECS Fargate)
resource "aws_ecs_cluster" "this" {
  name = var.cluster_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = var.common_tags
}

resource "aws_ecs_task_definition" "notifications" {
  family                   = "notifications-service"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  execution_role_arn       = aws_ecs_execution_role.arn
  task_role_arn            = aws_ecs_task_role.arn

  container_definitions = jsonencode([
    {
      name      = "notifications"
      image     = var.container_image
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          protocol      = "tcp"
        }
      ]
      environment = var.environment_variables
      secrets     = var.secrets
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/${var.service_name}"
          "awslogs-region"        = var.aws_region
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])

  tags = var.common_tags
}

resource "aws_ecs_service" "this" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.notifications.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = var.security_group_ids
    assign_public_ip = var.assign_public_ip
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.this.arn
    container_name   = "notifications"
    container_port   = var.container_port
  }

  deployment_controller {
    type = "ECS"
  }

  depends_on = [aws_lb_listener.this]

  tags = var.common_tags
}

# Stub: Application Load Balancer
resource "aws_lb" "this" {
  name               = "${var.service_name}-alb"
  internal           = var.alb_internal
  load_balancer_type = "application"
  security_groups    = var.alb_security_group_ids
  subnets            = var.subnet_ids

  enable_deletion_protection = var.alb_deletion_protection

  tags = var.common_tags
}

resource "aws_lb_target_group" "this" {
  name     = "${var.service_name}-tg"
  port     = var.container_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = var.health_check_path
    timeout             = 5
    unhealthy_threshold = 2
  }

  tags = var.common_tags
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.alb_listener_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

# Stub: roles de IAM para ECS
resource "aws_ecs_execution_role" "this" {
  name = "${var.service_name}-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "execution_policy" {
  role       = aws_ecs_execution_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_task_role" "this" {
  name = "${var.service_name}-task-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

// === ARCHIVO: modules/notifications_service/outputs.tf ===
# Outputs del módulo de notificaciones
# Superficie de práctica: el estudiante definirá los outputs necesarios

output "cluster_id" {
  description = "ID del cluster ECS"
  value       = aws_ecs_cluster.this.id
}

output "cluster_name" {
  description = "Nombre del cluster ECS"
  value       = aws_ecs_cluster.this.name
}

output "service_name" {
  description = "Nombre del servicio ECS"
  value       = aws_ecs_service.this.name
}

output "service_arn" {
  description = "ARN del servicio ECS"
  value       = aws_ecs_service.this.arn
}

output "task_definition_arn" {
  description = "ARN de la definición de tarea"
  value       = aws_ecs_task_definition.notifications.arn
}

output "alb_dns_name" {
  description = "DNS del Application Load Balancer"
  value       = aws_lb.this.dns_name
}

output "alb_arn" {
  description = "ARN del Application Load Balancer"
  value       = aws_lb.this.arn
}

output "target_group_arn" {
  description = "ARN del target group"
  value       = aws_lb_target_group.this.arn
}

output "execution_role_arn" {
  description = "ARN del rol de ejecución de ECS"
  value       = aws_ecs_execution_role.this.arn
}

output "task_role_arn" {
  description = "ARN del rol de tarea de ECS"
  value       = aws_ecs_task_role.this.arn
}

// === ARCHIVO: environments/dev/terraform.tfvars ===
# Valores de variables para el ambiente de desarrollo
# Configuración específica del entorno de desarrollo

# Configuración regional y de entorno
region              = "us-east-1"
environment_name    = "dev"
project_name        = "fintech-notifications"

# Red y conectividad
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]

# Configuración de instancias y compute
instance_type       = "t3.small"
min_instances       = 1
max_instances       = 2
desired_capacity    = 1

# Configuración del servicio de notificaciones
notification_service_enabled = true
notification_endpoint        = "https://dev-notifications.fintech.internal"
notification_provider        = "sns"
notification_retry_count     = 3
notification_timeout_seconds = 30

# Configuración de seguridad
enable_vpn_access         = true
enable_private_link       = false
allowed_cidr_blocks       = ["10.0.0.0/8"]
enable_deletion_protection = false

# Configuración de logging y monitoreo
enable_detailed_monitoring = true
log_retention_days        = 7
enable_cloudwatch_logs    = true
log_level                 = "debug"

# Configuración de backup
enable_backup            = false
backup_schedule          = "cron(0 5 ? * * *)"

# Configuración de alertas
enable_alerts            = true
alert_email              = "devops-dev@fintech.com"
cpu_threshold_percent    = 80
memory_threshold_percent = 85

# Tags obligatorios para todos los recursos
tags = {
  Environment = "dev"
  Project     = "fintech-notifications"
  ManagedBy   = "terraform"
  CostCenter  = "engineering"
  Owner       = "devops-team"
  Compliance  = "pci-dss"
}

# Configuración de certificados SSL
enable_ssl               = true
ssl_certificate_arn     = "arn:aws:acm:us-east-1:123456789012:certificate/dev-cert"

# Configuración de base de datos (si aplica)
db_instance_class       = "db.t3.micro"
db_allocated_storage    = 20
db_engine_version       = "14.7"

// === ARCHIVO: environments/prod/terraform.tfvars ===
# Valores de variables para el ambiente de producción
# Configuración严苛 de seguridad para producción

# Configuración regional y de entorno
region              = "us-east-1"
environment_name    = "prod"
project_name        = "fintech-notifications"

# Red y conectividad - configuración más restrictiva
vpc_cidr            = "172.16.0.0/16"
public_subnet_cidrs = ["172.16.1.0/24", "172.16.2.0/24"]
private_subnet_cidrs = ["172.16.10.0/24", "172.16.11.0/24", "172.16.12.0/24"]
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

# Configuración de instancias y compute - alta disponibilidad
instance_type       = "t3.medium"
min_instances       = 2
max_instances       = 5
desired_capacity    = 3

# Configuración del servicio de notificaciones
notification_service_enabled = true
notification_endpoint        = "https://notifications.fintech.com"
notification_provider        = "sns"
notification_retry_count     = 5
notification_timeout_seconds = 60

# Configuración de seguridad - producción严苛
enable_vpn_access         = true
enable_private_link       = true
allowed_cidr_blocks       = ["172.16.0.0/12"]
enable_deletion_protection = true

# Configuración de logging y monitoreo - mayor retención
enable_detailed_monitoring = true
log_retention_days        = 90
enable_cloudwatch_logs    = true
log_level                 = "info"

# Configuración de backup - obligatorio en producción
enable_backup            = true
backup_schedule          = "cron(0 3 ? * * *)"
retention_days           = 30

# Configuración de alertas - notificaciones a múltiples destinatarios
enable_alerts            = true
alert_email              = "devops-prod@fintech.com,oncall-prod@fintech.com"
cpu_threshold_percent    = 70
memory_threshold_percent = 75

# Tags obligatorios para todos los recursos
tags = {
  Environment = "prod"
  Project     = "fintech-notifications"
  ManagedBy   = "terraform"
  CostCenter  = "engineering"
  Owner       = "devops-team"
  Compliance  = "pci-dss"
  SLA         = "99.99"
  Critical    = "true"
}

# Configuración de certificados SSL - producción
enable_ssl               = true
ssl_certificate_arn     = "arn:aws:acm:us-east-1:123456789012:certificate/prod-cert"

# Configuración de base de datos - producción con alta disponibilidad
db_instance_class       = "db.r5.large"
db_allocated_storage    = 100
db_engine_version       = "14.7"
multi_az                = true

// === ARCHIVO: .github/workflows/ci-cd-pipeline.yml ===
name: CI/CD Pipeline - Fintech Notifications

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]
  workflow_dispatch:
    inputs:
      environment:
        description: 'Environment to deploy'
        required: true
        default: 'dev'
        type: choice
        options:
          - dev
          - staging
          - prod

env:
  AWS_REGION: us-east-1
  TERRAFORM_VERSION: 1.5.7
  DOCKER_BUILDKIT: 1
  TRIVY_VERSION: 0.48.0
  SONAR_SCANNER_VERSION: 4.8.0

jobs:
  # ===========================================
  # Stage 1: Build y análisis de código estático
  # ===========================================
  build-and-analyze:
    name: Build & Static Analysis
    runs-on: ubuntu-latest
    permissions:
      contents: read
      security-events: write
      actions: read

    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: ${{ env.TERRAFORM_VERSION }}
          cli_config_credentials_token: ${{ secrets.TF_API_TOKEN }}

      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: ${{ env.AWS_REGION }}

      - name: Verify Terraform format
        run: |
          terraform fmt -check -recursive
          echo "✓ Terraform format verified"

      - name: Validate Terraform configuration
        run: |
          terraform init -backend=false
          terraform validate
          echo "✓ Terraform configuration valid"

      - name: Run Terratest (plan verification)
        run: |
          terraform plan -out=tfplan
          echo "✓ Terraform plan generated successfully"

      - name: SonarCloud Scan
        uses: SonarSource/sonarcloud-github-action@master
        env:
          SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

      - name: Checkov Security Scan (IaC)
        id: checkov
        uses: bridgecrewio/checkov-action@master
        with:
          directory: .
          framework: terraform
          output_format: sarif
          output_file_path: results/checkov.sarif

      - name: Upload Checkov results to Security tab
        uses: github/codeql-action/upload-sarif@v2
        with:
          sarif_file: results/checkov.sarif

      - name: Store Terraform plan artifact
        uses: actions/upload-artifact@v3
        with:
          name: tfplan
          path: tfplan
          retention-days: 7

  # ===========================================
  # Stage 2: Escaneo de dependencias
  # ===========================================
  dependency-scan:
    name: Dependency Security Scan
    runs-on: ubuntu-latest
    permissions:
      contents: read
      security-events: write

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Run OWASP Dependency Check
        uses: dependency-check/Dependency-Check_Action@main
        id: owasp
        with:
          project: 'fintech-notifications'
          path: '.'
          format: 'SARIF'
          output: 'results/owasp'
          args: '--scan ./ --enableExperimental --failOnHighCVSS'

      - name: Upload OWASP results to Security tab
        uses: github/codeql-action/upload-sarif@v2
        with:
          sarif_file: results/owasp/dependency-check.sarif

      - name: Audit npm dependencies
        if: hashFiles('package-lock.json')
        run: |
          npm audit --audit-level=high --json > results/npm-audit.json || true

      - name: Audit Python dependencies
        if: hashFiles('requirements.txt')
        run: |
          pip install pip-audit
          pip-audit -r requirements.txt --format json > results/pip-audit.json || true

      - name: Upload dependency audit results
        uses: actions/upload-artifact@v3
        with:
          name: dependency-reports
          path: results/
          retention-days: 30

  # ===========================================
  # Stage 3: Build de imagen Docker
  # ===========================================
  docker-build:
    name: Docker Image Build
    runs-on: ubuntu-latest
    needs: [build-and-analyze]
    permissions:
      contents: read
      packages: write

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Login to GitHub Container Registry
        uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ghcr.io/${{ github.repository }}/notifications
          tags: |
            type=ref,event=branch
            type=sha,prefix={{branch}}-
            type=raw,value=${{ github.sha }}

      - name: Build Docker image
        uses: docker/build-push-action@v5
        with:
          context: .
          push: false
          tags: ${{ steps.meta.outputs.tags }}
          labels: ${{ steps.meta.outputs.labels }}
          cache-from: type=gha
          cache-to: type=gha,mode=max

      - name: Run Trivy vulnerability scanner
        uses: aquasecurity/trivy-action@master
        with:
          scan-type: 'image'
          scan-ref: 'ref:ghcr.io/${{ github.repository }}/notifications:${{ github.sha }}'
          format: 'sarif'
          output: 'results/trivy-image.sarif'
          severity: 'CRITICAL,HIGH'
          exit-code: '1'
          ignore-unfixed: true

      - name: Upload Trivy results to Security tab
        uses: github/codeql-action/upload-sarif@v2
        with:
          sarif_file: results/trivy-image.sarif

      - name: Push Docker image
        if: github.event_name == 'push' && (github.ref == 'refs/heads/main' || github.ref == 'refs/heads/develop')
        uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: ${{ steps.meta.outputs.tags }}
          labels: ${{ steps.meta.outputs.labels }}

      - name: Image digest report
        run: |
          echo "## Docker Image Build Report" >> $GITHUB_STEP_SUMMARY
          echo "- Image: ghcr.io/${{ github.repository }}/notifications" >> $GITHUB_STEP_SUMMARY
          echo "- SHA: ${{ github.sha }}" >> $GITHUB_STEP_SUMMARY
          echo "- Tags: ${{ steps.meta.outputs.tags }}" >> $GITHUB_STEP_SUMMARY

  # ===========================================
  # Stage 4: Quality Gates
  # ===========================================
  quality-gate:
    name: Quality Gates
    runs-on: ubuntu-latest
    needs: [docker-build, dependency-scan]
    permissions:
      contents: read

    outputs:
      quality_passed: ${{ steps.evaluate.outputs.quality_passed }}

    steps:
      - name: Evaluate Quality Gates
        id: evaluate
        run: |
          echo "Evaluating quality gates..."
          
          # Obtener resultados de SonarCloud
          SONAR_STATUS=${{ needs.build-and-analyze.outputs.sonar_status }}
          
          # Obtener resultados de Checkov
          CHECKOV_STATUS=${{ needs.build-and-analyze.outputs.checkov_status }}
          
          # Obtener resultados de OWASP
          OWASP_STATUS=${{ needs.dependency-scan.outputs.owasp_status }}
          
          # Obtener resultados de Trivy
          TRIVY_STATUS=${{ needs.docker-build.outputs.trivy_status }}
          
          echo "Quality Gate Evaluation:"
          echo "- SonarCloud Quality Gate: $SONAR_STATUS"
          echo "- Checkov Security: $CHECKOV_STATUS"
          echo "- OWASP Dependencies: $OWASP_STATUS"
          echo "- Trivy Image Scan: $TRIVY_STATUS"
          
          # Evaluación de calidad - todos los gates deben pasar
          if [ "$SONAR_STATUS" == "OK" ] && [ "$CHECKOV_STATUS" == "PASSED" ] && [ "$OWASP_STATUS" == "OK" ] && [ "$TRIVY_STATUS" == "OK" ]; then
            echo "quality_passed=true" >> $GITHUB_OUTPUT
            echo "✓ All quality gates passed"
          else
            echo "quality_passed=false" >> $GITHUB_OUTPUT
            echo "✗ Quality gates failed - review security reports"
            exit 1
          fi

  # ===========================================
  # Stage 5: Deploy to Development
  # ===========================================
  deploy-dev:
    name: Deploy to Development
    runs-on: ubuntu-latest
    needs: [quality-gate]
    if: github.ref == 'refs/heads/develop' || github.event_name == 'workflow_dispatch'
    environment:
      name: development
      url: https://dev-notifications.fintech.internal
    permissions:
      contents: read
      id-token: write

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: ${{ env.TERRAFORM_VERSION }}

      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          role-to-assume: ${{ secrets.AWS_DEV_ROLE_ARN }}
          aws-region: ${{ env.AWS_REGION }}

      - name: Terraform Init
        run: |
          cd environments/dev
          terraform init -backend-config=bucket=fintech-tfstate-prod -backend-config=key=notifications/dev/terraform.tfstate

      - name: Terraform Plan
        run: |
          cd environments/dev
          terraform plan -var-file=terraform.tfvars -out=tfplan

      - name: Terraform Apply
        run: |
          cd environments/dev
          terraform apply -auto-approve tfplan

      - name: Run healthcheck
        run: |
          chmod +x scripts/healthcheck.sh
          ./scripts/healthcheck.sh dev

      - name: Deployment notification
        run: |
          echo "✓ Deployment to DEV completed successfully"

  # ===========================================
  # Stage 6: Deploy to Production (con aprobación)
  # ===========================================
  deploy-prod:
    name: Deploy to Production
    runs-on: ubuntu-latest
    needs: [quality-gate, deploy-dev]
    if: github.ref == 'refs/heads/main' || (github.event_name == 'workflow_dispatch' && github.inputs.environment == 'prod')
    environment:
      name: production
      url: https://notifications.fintech.com
    permissions:
      contents: read
      id-token: write

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: ${{ env.TERRAFORM_VERSION }}

      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          role-to-assume: ${{ secrets.AWS_PROD_ROLE_ARN }}
          aws-region: ${{ env.AWS_REGION }}

      - name: Terraform Init
        run: |
          cd environments/prod
          terraform init -backend-config=bucket=fintech-tfstate-prod -backend-config=key=notifications/prod/terraform.tfstate

      - name: Terraform Plan (Preview)
        run: |
          cd environments/prod
          terraform plan -var-file=terraform.tfvars -out=tfplan
        continue-on-error: true

      - name: Create deployment PR comment
        if: github.event_name == 'pull_request'
        run: |
          echo "## Production Deployment Plan" >> $GITHUB_STEP_SUMMARY
          echo "A deployment to production has been initiated. Review the plan above." >> $GITHUB_STEP_SUMMARY

      - name: Terraform Apply
        run: |
          cd environments/prod
          terraform apply -auto-approve tfplan

      - name: Run healthcheck
        run: |
          chmod +x scripts/healthcheck.sh
          ./scripts/healthcheck.sh prod

      - name: Verify production deployment
        run: |
          echo "Verifying production endpoints..."
          curl -f https://notifications.fintech.com/health || exit 1
          echo "✓ Production deployment verified"

      - name: Deployment notification
        run: |
          echo "✓ Deployment to PROD completed successfully"
          echo "## Production Deployment Complete" >> $GITHUB_STEP_SUMMARY
          echo "- Environment: Production" >> $GITHUB_STEP_SUMMARY
          echo "- Timestamp: $(date -u +%Y-%m-%dT%H:%M:%SZ)" >> $GITHUB_STEP_SUMMARY
          echo "- Commit: ${{ github.sha }}" >> $GITHUB_STEP_SUMMARY

// === ARCHIVO: scripts/build.sh ===
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

// === ARCHIVO: scripts/healthcheck.sh ===
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

// === ARCHIVO: sonar-project.properties ===
sonar.projectKey=fintech-notifications-service
sonar.organization=fintech-devops
sonar.projectName=Notifications Service
sonar.projectVersion=1.0.0
sonar.sourceEncoding=UTF-8
sonar.sources=.
exclusions=**/node_modules/**,**/vendor/**,**/.terraform/**,**/environments/**
sonar.tests=.
sonar.test.inclusions=**/*test*.java,**/*test*.py,**/*test*.go
sonar.coverage.exclusions=**/*_test.go,**/vendor/**,**/.terraform/**
sonar.go.coverage.reportPaths=coverage.out
sonar.python.coverage.reportPaths=coverage.xml
sonar.java.binaries=target/classes
sonar.java.source=17
sonar.cloud.enabled=true
sonar.security.config.owasp=api
sonar.dependencyCheck.reportPath=dependency-check-report.xml
sonar.trivy.reportPath=trivy-results.json
sonar.qualitygate.wait=true
sonar.qualitygate.timeout=300

// === ARCHIVO: README.md ===
# Servicio de Notificaciones - Infraestructura como Código

Este repositorio contiene la infraestructura como código del servicio de notificaciones de la plataforma fintech, implementada con Terraform y protegida por un pipeline de CI/CD con escaneo de seguridad.

## Estructura del Proyecto

```
.
├── .github/workflows/      # Pipeline de CI/CD
├── environments/           # Configuración por ambiente
│   ├── dev/
│   └── prod/
├── modules/                # Módulos de Terraform reutilizables
│   └── notifications_service/
├── scripts/                # Scripts de automatización
├── main.tf                 # Definición principal de recursos
├── variables.tf            # Variables del proyecto
├── providers.tf            # Configuración de proveedores
├── outputs.tf              # Salidas de Terraform
└── Dockerfile              # Imagen del servicio
```

## Requisitos Previos

- Terraform >= 1.5
- Docker >= 20.x
- AWS CLI configurado con credenciales válidas
- Git

## Configuración Inicial

### Variables de Entorno

Configura las siguientes variables de entorno antes de ejecutar cualquier comando:

```bash
export AWS_ACCESS_KEY_ID="tu-access-key"
export AWS_SECRET_ACCESS_KEY="tu-secret-key"
export AWS_REGION="us-east-1"
```

### Archivos de Configuración

Los valores específicos por ambiente se encuentran en `environments/{env}/terraform.tfvars`. No modifies estos archivos directamente; usa las variables de Terraform.

## Comandos de Uso

### Inicializar Terraform

```bash
terraform init -backend=false
```

### Validar Configuración

```bash
terraform validate
```

### Planificar Cambios

```bash
terraform plan -var-file=environments/dev/terraform.tfvars
```

### Aplicar Infraestructura

```bash
terraform apply -var-file=environments/dev/terraform.tfvars
```

### Destruir Infraestructura

```bash
terraform destroy -var-file=environments/dev/terraform.tfvars
```

## Construcción de Imagen Docker

```bash
docker build -t notifications-service:latest .
```

## Pipeline de CI/CD

El pipeline automatizado se encuentra en `.github/workflows/ci-cd-pipeline.yml` e incluye:

- Construcción del código
- Ejecución de pruebas unitarias
- Escaneo de dependencias con OWASP Dependency-Check
- Escaneo de imágenes con Trivy
- Análisis estático con SonarCloud
- Despliegue a los ambientes configurados

## Módulos Disponibles

### notifications_service

Módulo que aprovisiona los recursos necesarios para el servicio de notificaciones:

- Función Lambda
- Cola de mensajes (SQS)
- Tópicos de SNS para notificaciones
- Tabla de DynamoDB para auditoría
- Roles y políticas de IAM

## Seguridad

- Los secretos nunca se almacenan en el repositorio
- Se utiliza AWS Secrets Manager para gestión de credenciales
- El pipeline requiere aprobación manual para producción
- Los quality gates de SonarCloud bloquean vulnerabilidades críticas

## Contributing

1. Crea un branch desde `main`
2. Realiza tus cambios en la rama de feature
3. Ejecuta `terraform validate` y `terraform plan` localmente
4. Abre un Pull Request
5. El pipeline ejecutará todas las verificaciones automáticamente

## Licencia

Proprietaria - Fintech Company
```
