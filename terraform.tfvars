region            = "us-east-1"
ami_id            = "ami-0b6c6ebed2801a5cb"
instance_type     = "t2.micro"
bucket_name       = "s11-s10-arnaud-bucket"   
key_pair_name     = "del-labs-key"
vpc_name          = "s11-vpc"
availability_zone = "us-east-1a"
sg_name           = "s11-sg"

# S3 Backend Configuration
backend_bucket_name     = "s11-terraform-state-s10arnaud"
backend_dynamodb_table  = "s11-terraform-state-locks"
backend_environment     = "shared"