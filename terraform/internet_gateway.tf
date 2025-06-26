# インターネットゲートウェイ定義

resource "aws_internet_gateway" "sample_gw" {
  vpc_id = aws_vpc.sample_vpc.id
  tags = {
    Name = "sample_gw"
  }
}
