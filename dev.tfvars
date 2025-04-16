region = "us-east-1"
prefix = "ss-iac-lab"
vpc_cidr     = "192.168.1.0/25"
subnets = [
  {
    az   = "a"
    cidr = "192.168.1.0/28"
  },
  {
    az   = "b"
    cidr = "192.168.1.16/28"
  },
  {
    az   = "a"
    cidr = "192.168.1.32/28"
  },
  {
    az   = "b"
    cidr = "192.168.1.48/28"
  },
  {
    az   = "a"
    cidr = "192.168.1.64/28"
  },
  {
    az   = "b"
    cidr = "192.168.1.80/28"
  }
]