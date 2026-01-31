module "vpc" {
  source            = "./module/vpc"
  cidr_block        = var.cidr_block
  vpc_name          = var.vpc_name
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
}

module "sg" {
  source          = "./module/sg"
  sg_name         = var.sg_name
  vpc_id          = module.vpc.vpc_id
  ssh_cidr_blocks = var.ssh_cidr_blocks
}

module "ec2_instance" {
  source = "./module/ec2"
  
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = module.vpc.subnet_id
  key_pair_name      = var.key_pair_name
  security_group_ids = [module.sg.sg_id]
}

module "s3_bucket" {
  source = "./module/s3"
  
  bucket_name = var.bucket_name
}

