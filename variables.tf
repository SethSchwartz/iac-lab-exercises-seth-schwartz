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
  description = "vpc_cidr"
}



variable "subnets" {
  type = list(any)
}

