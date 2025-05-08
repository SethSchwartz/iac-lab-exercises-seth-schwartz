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