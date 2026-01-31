variable "sg_name" {
  type = string
}

variable "description" {
  type    = string
  default = "Managed by Terraform"
}

variable "vpc_id" {
  type = string
}

variable "ssh_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
