# VPC定義
# cidr_blockはvariables.tfから参照しています

resource "aws_vpc" "sample_vpc" {
  cidr_block       = var.aws_vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "sample_vpc"
  }
}