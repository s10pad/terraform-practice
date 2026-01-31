resource "aws_s3_bucket" "s11_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = "dev"
  }
}
