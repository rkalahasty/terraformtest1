terraform {
  required_version = ">= 0.11.0"
}

resource "aws_s3_bucket_public_access_block" "LindsaysBucket" {
  bucket = aws_s3_bucket.LindsaysBucket.id

  block_public_acls   = false
  block_public_policy = false
  ignore_public_acls  = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket" "LindsaysBucket" {
  bucket = "lindsays-bucket"
  acl    = "private"

  versioning {
    enabled = false
  }
}

provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "ubuntu" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "${var.name}"
  }
}
