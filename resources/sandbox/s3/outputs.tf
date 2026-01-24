output "s3_bucket_name" {
  value = aws_s3_bucket.s10arnaud_bucket.bucket
}

output "region" {
  value = aws_s3_bucket.s10arnaud_bucket.region
}
