terraform {
  backend "s3" {
    bucket     = "terraform-js"
    region     = "us-east-1"
    key        = "terraform/EC2-Dev"
  }
}
