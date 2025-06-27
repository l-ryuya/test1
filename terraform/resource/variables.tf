# リージョン定義：github Actionでterraform実行時に引数指定する
variable "aws_region" {
  type        = string
  description = "Repository secretsで定義したregionを使用する"
}

# vpc cidr_block定義
variable "aws_vpc_cidr_block" {
  type = string
  description = "VPC_CIDR定義"
  default = "10.0.0.0/24"
}

# subnet cidr_block定義
variable "aws_subnet_cidr_block" {
  type = string
  description = "SUBNET_CIDR定義"
  default = "10.0.0.0/26"
}

# ルートテーブルの宛先CIDRブロックを設定する変数
variable "aws_route_cidr_block" {
  type = string
  description = "ルートの宛先CIDR定義"
  default = "0.0.0.0/0"
}

#  sshインバウンドルール定義
variable "aws_vpc_security_group_ssh" {
  type = string
  description = "ssh定義"
  default = "0.0.0.0/0"
}

#  httpインバウンドルール定義
variable "aws_vpc_security_group_http" {
  type = string
  description = "http定義"
  default = "0.0.0.0/0"
}
