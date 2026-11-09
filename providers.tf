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