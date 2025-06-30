# セキュリティグループ定義
resource "aws_security_group" "sample_security_group" {
  name        = "sample_security_group"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.sample_vpc.id

  tags = {
    Name = "sample_security_group"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.aws_vpc_security_group_http]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.aws_vpc_security_group_ssh]
  }
}