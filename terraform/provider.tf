terraform {
    backend "s3" {
    bucket = "nour-cicd-bucket"
    key = "statefile"
    region = "us-east-1"
    }
}

provider "aws" {
    region = "us-east-1"
}
