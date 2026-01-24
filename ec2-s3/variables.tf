variable "bucket_name" {
  type    = string
  default = "my-unique-bucket-s11"
}

variable "ami_id" {
  type    = string
  default = "ami-0ecb62995f68bb549"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "s11"
}

variable "security_group_id" {
  type    = string
  default = "sg-05b268438b8a19cea"
}

variable "subnet_id" {
  type    = string
  default = "subnet-096d45c28d9fb4c14"
}
