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
│   ├── s3-backend/            # S3 backend with cross-region replication
│   │   ├── main.tf
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

## S3 Backend Module (Cross-Region Replication)

The `s3-backend` module creates a secure Terraform state backend with:
- Primary S3 bucket in `us-east-1`
- Replica S3 bucket in `us-east-2`
- Cross-region replication (delete operations NOT replicated)
- Server-side encryption (KMS)
- DynamoDB table for state locking
- Public access blocked

### Deploy the Backend

```bash
cd module/s3-backend
terraform init
terraform plan -var="bucket_name=your-unique-bucket-name"
terraform apply -var="bucket_name=your-unique-bucket-name"
```

### Configure Your Projects to Use the Backend

After deploying the backend, add this to your Terraform configurations:

```hcl
terraform {
  backend "s3" {
    bucket         = "your-unique-bucket-name"
    key            = "env/dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-locks"
  }
}
```

### Backend Module Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `bucket_name` | Name of the primary S3 bucket (must be globally unique) | Required |
| `dynamodb_table_name` | Name of the DynamoDB table for state locking | `terraform-state-locks` |
| `environment` | Environment tag | `shared` |

## Deployment

### Deploy Infrastructure (dev environment)

```bash
cd resources/dev
terraform init
terraform plan
terraform apply
```

### Deploy S3 Backend

```bash
cd module/s3-backend
terraform init
terraform apply -var="bucket_name=s11-terraform-state-s10arnaud"
```
