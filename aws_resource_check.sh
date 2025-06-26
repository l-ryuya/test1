#!/bin/bash
VPC_ID=$(aws ec2 describe-vpcs --filter "Name=tag:Name,Values=dougbako" --query "Vpcs[0].VpcId" --output text 2> /dev/null)
  if [ "$VPC_ID" != "None" ]; then
    echo "既存のVPC($VPC_ID)をimportします"
    terraform import aws_vpc.dougbako_vpc $VPC_ID
  else
    echo "VPCがないので作成します"
  fi