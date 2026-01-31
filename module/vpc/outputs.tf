output "vpc_id" {
  value = aws_vpc.s11_vpc_s10arnaud.id
}

output "subnet_id" {
  value = aws_subnet.s11_subnet_s10arnaud.id
}

output "igw_id" {
  value = aws_internet_gateway.s11_igw_s10arnaud.id
}
