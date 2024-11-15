terraform {
  required_version = ">= 0.11.0"
}

provider "aws" {
  region = "${var.aws_region}"
}

provider "aws" {
  alias  = "east"
  region = "us-east-1"
}

resource "aws_instance" "ubuntu" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.aws_region}a"

  tags {
    Name = "${var.name}"
  }
}

resource "aws_s3_bucket" "private_bucket" {
  bucket = var.bucket_name
  force_destroy = true

  tags = {
    Name = "Private S3 Bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "private_bucket_access" {
  bucket = aws_s3_bucket.private_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "private_bucket_versioning" {
  bucket = aws_s3_bucket.private_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket" "sritans_bucket" {
  provider = aws.east
  bucket = var.sritans_bucket_name
  force_destroy = true

  tags = {
    Name = "Sritan's Private S3 Bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "sritans_bucket_access" {
  provider = aws.east
  bucket = aws_s3_bucket.sritans_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "sritans_bucket_versioning" {
  provider = aws.east
  bucket = aws_s3_bucket.sritans_bucket.id
  versioning_configuration {
    status = "Disabled"
  }
}

