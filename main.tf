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

# STATE
# DESIRED - KNOWN - ACTUAL

output "my_s3_bucket_versioning" {
  value = aws_s3_bucket.my_s3_bucket.versioning[0].enabled
}

output "my_s3_bucket_complete_details" {
  value = aws_s3_bucket.my_s3_bucket
}
