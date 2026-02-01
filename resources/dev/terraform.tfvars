# General
region = "us-east-1"

# VPC Module
vpc_name          = "s11-vpc-s10-arnaud"
cidr_block        = "10.0.0.0/16"
subnet_cidr       = "10.0.1.0/24"
availability_zone = "us-east-1a"

# Security Group Module
sg_name         = "s11-sg-s10-arnaud"
description     = "Security group for s11 dev environment"
ssh_cidr_blocks = ["0.0.0.0/0"]

# EC2 Module
instance_name = "s11-ec2-instance-s10-arnaud"
ami_id        = "ami-0b6c6ebed2801a5cb"
instance_type = "t2.micro"
key_pair_name = "del-labs-key"

# S3 Module
bucket_name = "s11-s3-s10-arnaud-bucket"