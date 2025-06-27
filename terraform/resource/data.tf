# VPCを作成したときに自動で作成されるルートテーブルを参照する

data "aws_route_table" "sample_main_route_table" {
  vpc_id = aws_vpc.sample_vpc.id
  filter {
    name   = "association.main"
    values = ["true"]
  }
}
