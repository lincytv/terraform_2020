resource "aws_vpc" "elk_internal" {
cidr_block = "10.0.0.0/16"
enable_dns_hostnames = true
tags = {
  Name = "elk_internal"
  }
}

output "defaulro" {
  value = aws_vpc.elk_internal.default_route_table_id
}

resource "aws_subnet" "public_subnet_01" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.elk_internal.id
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    Name = "elk_public_01"
  }
}
resource "aws_subnet" "private_subnet_01" {
  cidr_block = "10.0.3.0/24"
  vpc_id = aws_vpc.elk_internal.id
  availability_zone = "us-east-1a"

  tags = {
    Name = "elk_private_01"
  }
}
resource "aws_subnet" "public_subnet_02" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.elk_internal.id
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"

  tags = {
    Name = "elk_public_02"
  }
}
resource "aws_subnet" "private_subnet_02" {
  cidr_block = "10.0.4.0/24"
  vpc_id = aws_vpc.elk_internal.id
  availability_zone = "us-east-1b"

  tags = {
    Name = "elk_private_02"
  }
}

resource "aws_internet_gateway" "elk_igw" {
  vpc_id = aws_vpc.elk_internal.id

  tags = {
    Name = "elk_igw"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.elk_internal.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.elk_igw.id
  }

  tags = {
    Name = "igw_route"
  }
}
resource "aws_route_table_association" "routeassociate1" {
  subnet_id      = aws_subnet.public_subnet_01.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "routeassociate2" {
  subnet_id      = aws_subnet.public_subnet_02.id
  route_table_id = aws_route_table.route_table.id
}
