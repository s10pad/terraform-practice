
module "vpc" {
  source = "git::https://github.com/s10pad/terraform-practice.git//module/vpc"

  Name = var.vpc_name
  cidr_block = var.cidr_block

  vpc_id = aws_vpc.s11_vpc_s10arnaud.id
  availability_zone = var.availability_zone
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  
}



module "sg" {
  source = "git::https://github.com/s10pad/terraform-practice.git//module/sg"

  name        = var.sg_name
  description = var.description
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_name
  }
}

module "ec2_instance" {
  source = "git::https://github.com/s10pad/terraform-practice.git//module/ec2"


  name          = var.instance_name
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.subnet_id
  key_pair_name = var.key_pair_name
}

module "s3_bucket" {
  source = "git::https://github.com/s10pad/terraform-practice.git//module/s3"
  version = "~> 5.0"

  bucket_name = var.bucket_name
}
