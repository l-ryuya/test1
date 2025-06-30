#!/bin/bash

VPC_ID=$(aws ec2 describe-vpcs --filter "Name=tag:Name,Values=sample_vpc" --query "Vpcs[0].VpcId" --output text 2>/dev/null)
if [ -n "$VPC_ID" ]; then
  echo "既存のVPC($VPC_ID)をimportします"
  terraform import aws_vpc.sample_vpc "$VPC_ID"
else
  echo "VPCがないので作成します"
fi

SUBNET_ID=$(aws ec2 describe-subnets --filter "Name=tag:Name,Values=sample_subnet" --query "Subnets[0].SubnetId" --output text 2>/dev/null)
if [ -n "$SUBNET_ID" ]; then
  echo "既存のサブネット($SUBNET_ID)をimportします"
  terraform import aws_subnet.sample_subnet "$SUBNET_ID"
else
  echo "既存のサブネットがないので作成します"
fi

SECURITY_GROUP_ID=$(aws ec2 describe-security-groups --filters Name=tag:Name,Values=sample_security_group --query "SecurityGroups[0].GroupId" --output text 2>/dev/null)
echo $SECURITY_GROUP_ID
if [ -n "$SECURITY_GROUP_ID" ]; then
  echo "既存のセキュリティグループ($SECURITY_GROUP_ID)をimportします"
  terraform import aws_security_group.sample_security_group "$SECURITY_GROUP_ID"
else
  echo "セキュリティグループがないので作成します"
fi

INTERNET_GW_ID=$(aws ec2 describe-internet-gateways --filters Name=tag:Name,Values=sample_gw --query "InternetGateways[0].InternetGatewayId" --output text 2>/dev/null)
if [ -n "$INTERNET_GW_ID" ]; then
  echo "既存のインターネットゲートウェイ($INTERNET_GW_ID)をimportします"
  terraform import aws_internet_gateway.sample_gw "$INTERNET_GW_ID"
else
  echo "インターネットゲートウェイがないので作成します"
fi

MAIN_ROUTE_ID=$(aws ec2 describe-route-tables --filters "Name=vpc-id,Values=$VPC_ID" --query "RouteTables[*].RouteTableId" --output text 2>/dev/null)
if [ -n "$MAIN_ROUTE_ID" ]; then
  echo "既存のルートテーブル($MAIN_ROUTE_ID)をimportします"
  terraform import aws_internet_gateway.sample_gw "$MAIN_ROUTE_ID"
else
  echo "ルートテーブルがないので作成します"
fi