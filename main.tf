# plan - execute
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "my-s3-bucket-ntntuyen-002"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
