output "s3_bucket_name" {
  value = aws_s3_bucket.s11_bucket.bucket
}

output "ec2_instance_id" {
  value = aws_instance.s11_ec2.id
}

output "ec2_public_ip" {
  value = aws_instance.s11_ec2.public_ip
}
