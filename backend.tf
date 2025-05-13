terraform {
  backend "s3" {
    bucket = "ss-iac-lab-tfstate"
    key    = "iac-lab-exercises-seth-schwartz/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "ss-iac-lab-tfstate-locks"
    encrypt        = true
  }
}