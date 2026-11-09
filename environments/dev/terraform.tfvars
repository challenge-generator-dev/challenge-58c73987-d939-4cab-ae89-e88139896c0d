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