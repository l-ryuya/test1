# サブネット定義
# cidr_blockはvariables.tfから参照しています

resource "aws_subnet" "sample_subnet" {
  vpc_id     = aws_vpc.sample_vpc.id
  cidr_block = var.aws_subnet_cidr_block

  tags = {
    Name = "sample_subnet"
  }
}