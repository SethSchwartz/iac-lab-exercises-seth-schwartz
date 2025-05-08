output "ecr_url" {
  description = "The Elastic Container Registry (ECR) URL."
  value       = aws_ecr_repository.api.repository_url
}

output "ecs_security_group_id" {
  description = "ECS Security group Id"
  value       = aws_security_group.ecs.id
}

variable "prefix" {
  type        = string
  description = "prefix"
}

variable "region" {
  type        = string
  description = "region"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}
variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs"
}
variable "alb_target_group_arn" {
  type        = string
  description = "ALB Target Group ARN"
}
variable "alb_security_group_id" {
  type        = string
  description = "ALB Security Group ID"
}