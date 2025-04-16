region = "us-east-1"
prefix = "ss-iac-lab"
vpc_cidr     = "192.168.1.0/25"
subnets = [
  {
    az   = "a"
    cidr = cidrsubnet(var.vpc_cidr, 4, 0)
  },
  {
    az   = "b"
    cidr = cidrsubnet(var.vpc_cidr, 4, 1)
  },
  {
    az   = "a"
    cidr = cidrsubnet(var.vpc_cidr, 4, 2)
  },
  {
    az   = "b"
    cidr = cidrsubnet(var.vpc_cidr, 4, 3)
  },
  {
    az   = "a"
    cidr = cidrsubnet(var.vpc_cidr, 4, 4)
  },
  {
    az   = "b"
    cidr = cidrsubnet(var.vpc_cidr, 4, 5)
  }
]