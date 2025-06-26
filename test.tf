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