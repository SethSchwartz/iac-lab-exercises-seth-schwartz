variable "db_name" {
  type        = string
  description = "Database name"
}

variable "db_username" {
  type        = string
  description = "Database username"
}

variable "prefix" {
  type        = string
  description = "prefix"
}

variable "vpc_id" {
  description = "ID of the VPC where RDS will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where RDS will be deployed"
  type        = list(string)
}

variable "allow_security_group_ids" {
  type        = list(string)
  description = "security group allow to access the db"
}
