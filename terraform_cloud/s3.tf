resource "aws_s3_bucket" "s3_bucket_terraform_cloud" {
  bucket = "${var.prefix}-tf-cloud-tfstate"

  tags = {
    Name        = "${var.prefix}-tf-cloud-tfstate"
    Environment = "Dev"
  }
}