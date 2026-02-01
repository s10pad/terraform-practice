# VPC Module Outputs
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = module.vpc.subnet_id
}

output "igw_id" {
  description = "ID of the Internet Gateway"
  value       = module.vpc.igw_id
}

# Security Group Module Outputs
output "sg_id" {
  description = "ID of the security group"
  value       = module.sg.sg_id
}

# EC2 Module Outputs
output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = module.ec2_instance.ec2_instance_id
}

output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2_instance.ec2_public_ip
}

# S3 Module Outputs
output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = module.s3_bucket.bucket_name
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = module.s3_bucket.bucket_arn
}

# S3 Backend Module Outputs
output "backend_primary_bucket_name" {
  description = "Name of the primary S3 state bucket"
  value       = module.s3_backend.primary_bucket_name
}

output "backend_primary_bucket_arn" {
  description = "ARN of the primary S3 state bucket"
  value       = module.s3_backend.primary_bucket_arn
}

output "backend_replica_bucket_name" {
  description = "Name of the replica S3 state bucket"
  value       = module.s3_backend.replica_bucket_name
}

output "backend_replica_bucket_arn" {
  description = "ARN of the replica S3 state bucket"
  value       = module.s3_backend.replica_bucket_arn
}

output "backend_dynamodb_table_name" {
  description = "Name of the DynamoDB table for state locking"
  value       = module.s3_backend.dynamodb_table_name
}

output "backend_replication_role_arn" {
  description = "ARN of the replication IAM role"
  value       = module.s3_backend.replication_role_arn
}

output "backend_config" {
  description = "Backend configuration block for use in other projects"
  value       = module.s3_backend.backend_config
}
