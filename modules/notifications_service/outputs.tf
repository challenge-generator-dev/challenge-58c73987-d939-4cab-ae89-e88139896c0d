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