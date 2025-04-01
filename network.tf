resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"

  tags = {
    Name = "${var.prefix}-vpc"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet1_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = format("%s-public-subnet-1", var.prefix)
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet2_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = format("%s-public-subnet-2", var.prefix)
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet3_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = format("%s-public-subnet-3", var.prefix)
  }
}

resource "aws_subnet" "subnet4" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet4_cidr
  availability_zone = "us-east-1b"

  tags = {
    Name = format("%s-public-subnet-4", var.prefix)
  }
}

resource "aws_subnet" "subnet5" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet5_cidr
  availability_zone = "us-east-1b"

  tags = {
    Name = format("%s-public-subnet-5", var.prefix)
  }
}

resource "aws_subnet" "subnet6" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet6_cidr
  availability_zone = "us-east-1b"

  tags = {
    Name = format("%s-public-subnet-6", var.prefix)
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
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.prefix}-private-route-table"
  }
}

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.subnet4.id
  route_table_id = aws_route_table.private.id
}