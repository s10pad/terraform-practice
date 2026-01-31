resource "aws_vpc" "s11_vpc_s10arnaud" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "s11_subnet_s10arnaud" {
  vpc_id            = aws_vpc.s11_vpc_s10arnaud.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.vpc_name}-subnet"
  }
}

resource "aws_internet_gateway" "s11_igw_s10arnaud" {
  vpc_id = aws_vpc.s11_vpc_s10arnaud.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}
