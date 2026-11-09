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