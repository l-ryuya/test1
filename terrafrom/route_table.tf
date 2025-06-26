# ルートテーブルの宛先指定

resource "aws_route" "internet_access" {
  route_table_id         = data.aws_route_table.sample_main_route_table.id
  destination_cidr_block = var.aws_route_cidr_block
  gateway_id             = aws_internet_gateway.sample_gw.id
}

# サブネットをメインルートテーブルにアタッチ
resource "aws_route_table_association" "sample_subnet_attache_a" {
  subnet_id      = aws_subnet.sample_subnet.id
  route_table_id = data.aws_route_table.sample_main_route_table.id
}
