data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "${var.prefix}-vpc"
  cidr = var.vpc_cidr

  azs             =  data.aws_availability_zones.available.names
  private_subnets = [cidrsubnet(var.vpc_cidr, 3, 1), cidrsubnet(var.vpc_cidr, 3, 2)]
  public_subnets  = [cidrsubnet(var.vpc_cidr, 3, 3), cidrsubnet(var.vpc_cidr, 3, 4)]
  intra_subnets =   [cidrsubnet(var.vpc_cidr, 3, 5), cidrsubnet(var.vpc_cidr, 3, 6)]

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
    Name = "${var.prefix}-vpc"
  }
}

