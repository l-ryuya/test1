#!/bin/bash
VPC_ID=$(aws ec2 describe-vpcs --filter "Name=tag:Name,Values=sample_vpc" --query "Vpcs[0].VpcId" --output text 2> /dev/null)
  if [ "$VPC_ID" != "None" ]; then
    echo "既存のVPC($VPC_ID)をimportします"
    terraform import aws_vpc.sample_vpc $VPC_ID
  else
    echo "VPCがないので作成します"
  fi

SUBNET_ID=$(aws ec2 describe-subnets --filter "Name=tag:Name,Values=sample_subnet" --query "Subnets[0].SubnetId" --output text 2> /dev/null)
  if [ "$SUBNET_ID" != "None" ]; then
    echo "既存のサブネット($SUBNET_ID)をimportします"
    terraform import aws_subnet.sample_subnet $SUBNET_ID
  else
    echo "既存のサブネットがないので作成します"
  fi

SECURITY_GROUP_ID=$(aws ec2 describe-security-groups   --filters Name=tag:Name,Values=sample_security_group --query "SecurityGroups[*].GroupId" --output text 2> /dev/null)
  if [ "$SECURITY_GROUP_ID" != "None" ]; then
    echo "既存のセキュリティグループ($SECURITY_GROUP_ID)をimportします"
    terraform import aws_security_group.sample_security_group $SECURITY_GROUP_ID
  else
    echo "subnetがないので作成します"
  fi

INTERNET_GW_ID=$(aws ec2 describe-internet-gateways --filters Name=tag:Name,Values=sample_gw --query "InternetGateways[*].InternetGatewayId" --output text 2> /dev/null)
  if [ "$INTERNET_GW_ID" != "None" ]; then
    echo "既存のインターネットゲートウェイ($INTERNET_GW_ID)をimportします"
    terraform import aws_internet_gateway.sample_gw $INTERNET_GW_ID
  else
    echo "インターネットゲートウェイがないので作成します"
  fi