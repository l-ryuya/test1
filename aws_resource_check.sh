#!/bin/bash
VPC_ID=$(aws ec2 describe-vpcs --filter "Name=tag:Name,Values=dougbako_vpc" --query "Vpcs[0].VpcId" --output text 2> /dev/null)
  if [ "$VPC_ID" != "None" ]; then
    echo "既存のVPC($VPC_ID)をimportします"
    terraform import aws_vpc.dougbako_vpc $VPC_ID
  else
    echo "VPCがないので作成します"
  fi

SUBNET_ID=$(aws ec2 describe-subnets --filter "Name=tag:Name,Values=dougbako_subnet" --query "Subnets[0].SubnetId" --output text 2> /dev/null)
  if [ "$SUBNET_ID" != "None" ]; then
    echo "既存のVPC($SUBNET_ID)をimportします"
    terraform import aws_subnet.dougbako_subnet $SUBNET_ID
  else
    echo "VPCがないので作成します"
  fi