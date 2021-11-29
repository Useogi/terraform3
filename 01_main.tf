provider "aws" {
  region = "ap-northeast-2" // 참조값은 "" 사용X
}
# Key
resource "aws_key_pair" "useogi_key" {
  key_name   = var.key
  public_key = file("../../.ssh/useogi-key.pub")
}
# VPC
resource "aws_vpc" "useogi_vpc" {
  cidr_block           = var.cidr_main
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    "Name" = "${var.name}-vpc" // 문자열 안에서 참조할때!
  }
}

# public subnet
resource "aws_subnet" "useogi_pub" {
  count             = length(var.pub_sub) #2
  vpc_id            = aws_vpc.useogi_vpc.id
  cidr_block        = var.pub_sub[count.index] #index 0 -> 10.0.0.0/24
  availability_zone = "${var.region}${var.ava_zone[count.index]}"
  tags = {
    "Name" = "${var.name}_pub${var.ava_zone[count.index]}"
  }
}

# private subnet
resource "aws_subnet" "useogi_pri" {
  count             = length(var.pri_sub)
  vpc_id            = aws_vpc.useogi_vpc.id
  cidr_block        = var.pri_sub[count.index]
  availability_zone = "${var.region}${var.ava_zone[count.index]}"
  tags = {
    "Name" = "${var.name}_pri${var.ava_zone[count.index]}"
  }
}

# private db subnet
resource "aws_subnet" "useogi_pridb" {
  count             = 2
  vpc_id            = aws_vpc.useogi_vpc.id
  cidr_block        = var.pri_subdb[count.index]
  availability_zone = "${var.region}${var.ava_zone[count.index]}"
  tags = {
    "Name" = "${var.name}_pridb${var.ava_zone[count.index]}"
  }
}
