resource "aws_s3_bucket" "meubucket" {
  bucket = "colombo-bucket-remote-state"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.meubucket.id
  versioning_configuration {
    status = "Enabled"
  }
}