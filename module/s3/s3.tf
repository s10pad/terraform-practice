resource "aws_s3_bucket" "s11_bucket_s10arnaud"{
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
  }
}
