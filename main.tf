terraform {
  required_version = ">= 0.11.0"
}

resource "aws_s3_bucket" "LindsaysBucket" {
  bucket = "lindsays-bucket"
  acl    = "public-read"

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
