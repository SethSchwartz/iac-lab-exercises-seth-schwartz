variable "prefix" {
  type        = string
  description = "prefix"
}

variable "region" {
  type        = string
  description = "region"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "repo_name" {
  type        = string
  description = "ECR repository name"
  default = "SethSchwartz/iac-lab-exercises-seth-schwartz"
}
