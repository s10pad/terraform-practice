resource "aws_s3_bucket" "s10arnaud_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = "dev"
  }
}
