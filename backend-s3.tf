terraform {
  backend "s3" {
    bucket = "terraform-aws-project-state-08"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}