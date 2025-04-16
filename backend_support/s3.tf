resource "aws_s3_bucket" "backend-s3-ss" {
  bucket = "${var.prefix}-bucket"
  force_destroy = true

  tags = {
    Name        = "${var.prefix}-tfstate"
  }

   lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "backend-s3-versioning" {
  bucket = aws_s3_bucket.backend-s3-ss.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "backend_s3_encryption_config" {
  bucket = aws_s3_bucket.backend-s3-ss.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "backend_s3_access_rules" {
  bucket = aws_s3_bucket.backend-s3-ss.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}