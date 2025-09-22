terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}
locals {
  env = "dev"
  subnets = {
    a = "10.0.1.0/24"
    b = "10.0.2.0/24"
  }
}

resource "aws_vpc" "main" {

}

resource "aws_subnet" "public" {
  for_each = local.subnets
  vpc_id = aws_vpc.main.id
  cidr_block = each.value
  tags = {
    Name = "${local.env}-subnet-${each.key}"
  }

}