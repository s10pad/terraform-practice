

output "ec2_instance_id" {
  value = aws_instance.s11_ec2_s10arnaud.id
}

output "ec2_public_ip" {
  value = aws_instance.s11_ec2_s10arnaud.public_ip
}

output "instance_name" {
  value = aws_instance.s11_ec2_s10arnaud.instance_name
}