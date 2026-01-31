# Terraform Modules Repository

This repository contains reusable Terraform modules and environment-specific configurations.

## Project Structure

```
s11-tf-modules/
├── module/                    # Reusable Terraform modules
│   ├── ec2/                   # EC2 instance module
│   │   ├── ec2.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── s3/                    # S3 bucket module
│   │   ├── s3.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── sg/                    # Security group module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── vpc/                   # VPC module
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
└── resources/                 # Environment configurations
    ├── dev/                   # Development environment
    │   ├── main.tf
    │   ├── variables.tf
    │   ├── outputs.tf
    │   ├── provider.tf
    │   └── terraform.tfvars
    ├── sandbox/               # Sandbox environment
    └── prod/                  # Production environment
```

## Module Usage

### Option 1: Using Local Paths

When working locally or within the same repository, reference modules using relative paths:

```hcl
module "vpc" {
  source = "../../module/vpc"

  vpc_name          = var.vpc_name
  cidr_block        = var.cidr_block
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
}

module "sg" {
  source = "../../module/sg"

  sg_name         = var.sg_name
  description     = var.description
  vpc_id          = module.vpc.vpc_id
  ssh_cidr_blocks = var.ssh_cidr_blocks
}

module "ec2_instance" {
  source = "../../module/ec2"

  instance_name     = var.instance_name
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.vpc.subnet_id
  key_name          = var.key_pair_name
  security_group_id = module.sg.sg_id
  region            = var.region
}

module "s3_bucket" {
  source = "../../module/s3"

  bucket_name = var.bucket_name
  region      = var.region
}
```

### Option 2: Using Git Repository (Remote Source)

Reference modules from a Git repository for consistent deployments across teams:

```hcl
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
```

#### Pin to a Specific Version

```hcl
source = "git::https://github.com/s10pad/terraform-practice.git//module/vpc?ref=v1.0.0"
source = "git::https://github.com/s10pad/terraform-practice.git//module/vpc?ref=main"
```

## Deployment

```bash
cd resources/dev
terraform init
terraform plan
terraform apply
```
