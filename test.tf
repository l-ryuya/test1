resource "aws_vpc" "dougbako_vpc" {
  cidr_block       = "10.0.0.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "dougbako_vpc"
  }
}

resource "aws_subnet" "dougbako_subnet" {
  vpc_id     = aws_vpc.dougbako_vpc.id
  cidr_block = "10.0.0.0/26"

  tags = {
    Name = "dougbako_subnet"
  }
}

resource "aws_internet_gateway" "dougbako_gw" {
  vpc_id = aws_vpc.dougbako_vpc.id

  tags = {
    Name = "dougbako_gw"
  }
}

data "aws_route_table" "dougbako_main_route_table" {
  vpc_id = aws_vpc.dougbako_vpc.id
  filter {
    name   = "association.main"
    values = ["true"]
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = data.aws_route_tables.main.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dougbako_gw.id
}

resource "aws_route_table_association" "dougbako_subnet_attache_a" {
  subnet_id      = aws_subnet.dougbako_subnet.id
  route_table_id = data.aws_route_table.dougbako_main_route_table.id
}