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
