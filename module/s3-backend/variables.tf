variable "bucket_name" {
  description = "Name of the primary S3 bucket for Terraform state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for state locking"
  type        = string
  default     = "terraform-state-locks"
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "shared"
}
