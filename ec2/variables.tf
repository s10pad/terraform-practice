variable "ami_id" {
  description = "The ID of the AMI to use for the instance"
  type        = string
  
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in"
  type        = string
  
}

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "The name of the key pair to use for the EC2 instance"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs for the instance"
  type        = list(string)
  default     = []
}