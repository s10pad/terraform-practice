
module "vpc" {
  source = "git::https://github.com/s10pad/terraform-practice.git//module/vpc"

  vpc_name          = var.vpc_name
  cidr_block        = var.cidr_block
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
}



module "sg" {
  source = "git::https://github.com/s10pad/terraform-practice.git//module/sg"

  sg_name         = var.sg_name
  description     = var.description
  vpc_id          = module.vpc.vpc_id
  ssh_cidr_blocks = var.ssh_cidr_blocks
}

module "ec2_instance" {
  source = "git::https://github.com/s10pad/terraform-practice.git//module/ec2"

  instance_name     = var.instance_name
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.vpc.subnet_id
  key_name          = var.key_pair_name
  security_group_id = module.sg.sg_id
  region            = var.region
}

module "s3_bucket" {
  source = "git::https://github.com/s10pad/terraform-practice.git//module/s3"

  bucket_name = var.bucket_name
  region      = var.region
}
