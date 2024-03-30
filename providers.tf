terraform {
  backend "s3" {
    bucket = "nour-cicd-bucket"
    key    = "state"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
