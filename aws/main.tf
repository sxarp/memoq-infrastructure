provider "aws" {
  region                  = "ap-northeast-1"
  shared_credentials_file = "credentials"
  profile                 = "terraform"
  version                 = "~> 1.39"
}

terraform {
  backend "s3" {
    bucket = "sxarp-terraform"
    key    = "state"
    region = "ap-northeast-1"
    shared_credentials_file = "credentials"
    profile                 = "terraform"
  }
}

resource "aws_s3_bucket" "terraform" {
  bucket = "sxarp-terraform"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags {
    Name        = "terraform"
  }
}
