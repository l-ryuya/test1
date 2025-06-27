# セキュリティグループ定義
resource "aws_security_group" "sample_security_group" {
  name        = "sample_security_group"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.sample_vpc.id

  tags = {
    Name = "sample_security_group"
  }
}

# sshインバウンドルール定義
resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.sample_security_group.id
  cidr_ipv4         = var.aws_vpc_security_group_ssh
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# httpインバウンドルール
resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.sample_security_group.id
  cidr_ipv4         = var.aws_vpc_security_group_http
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}