terraform {
  required_version = ">= 0.11.0"
}

provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "ubuntu" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.aws_region}a"

  tags {
    Name = "${var.name}"
  }
}

resource "aws_s3_bucket" "s3bucket" {
  bucket = "s3bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Environment = "development"
    Project     = "example"
  }
}

resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "my-s3-bucket"
  
  tags = {
    Environment = "Development"
    Project     = "ExampleProject"
  }
}

resource "aws_s3_bucket_public_access_block" "my_s3_bucket" {
  bucket = aws_s3_bucket.my_s3_bucket.id
  
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_versioning" "my_s3_bucket" {
  bucket = aws_s3_bucket.my_s3_bucket.id
  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "my_s3_bucket" {
  bucket = aws_s3_bucket.my_s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_acl" "my_s3_bucket" {
  bucket = aws_s3_bucket.my_s3_bucket.id
  acl    = "public-read"
}
