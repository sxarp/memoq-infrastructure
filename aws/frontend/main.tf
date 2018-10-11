resource "aws_s3_bucket" "bucket" {
  bucket = "memoq-${var.env}"
  acl    = "private"

  versioning {
    enabled = false
  }

  tags {
    Name = "memoq-${var.env}"
  }
}
