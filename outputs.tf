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