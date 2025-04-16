resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"

  tags = {
    Name = "${var.prefix}-vpc"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public_subnets" {
  count = 2
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnets[count.index].cidr
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = format("%s-public-subnet-%s", var.prefix, count.index)
  }
}

resource "aws_subnet" "private_subnets" {
  count = 2
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnets[count.index + 2].cidr
  availability_zone = data.aws_availability_zones.available.names[count.index + 2]

  tags = {
    Name = format("%s-private-subnet-%s", var.prefix, count.index + 2)
  }
}

resource "aws_subnet" "secure_subnets" {
  count = 2

  vpc_id = aws_vpc.main.id
  cidr_block = var.subnets[count.index + 4].cidr
  availability_zone = data.aws_availability_zones.available.names[count.index + 4]

  tags = {
    Name = format("%s-secure-subnet-%s", var.prefix, count.index + 4)
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.prefix}-gw"
  }
}

resource "aws_eip" "lb" {
  domain   = "vpc"

  tags = {
    Name = "${var.prefix}-eip"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.subnet1.id

  tags = {
    Name = "${var.prefix}-NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.prefix}-public-route-table"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "${var.prefix}-private-route-table"
  }
}

resource "aws_route_table_association" "public" {
  for_each = {
    public1 = aws_subnet.public_subnets[0].id
    public2 = aws_subnet.public_subnets[1].id
  }

  subnet_id      = each.value
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  for_each = {
    private1 = aws_subnet.private_subnets[0].id
    private2 = aws_subnet.private_subnets[1].id
  }

  subnet_id      = each.value
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "secure" {
  for_each = {
    private1 = aws_subnet.secure_subnets[0].id
    private2 = aws_subnet.secure_subnets[1].id
  }

  subnet_id      = each.value
  route_table_id = aws_route_table.private.id
}
