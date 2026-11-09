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