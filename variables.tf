variable "aws_region" {
  description = "AWS region"
  default = "us-west-1"
}

variable "ami_id" {
  description = "ID of the AMI to provision. Default is Ubuntu 14.04 Base Image"
  default = "ami-05c65d8bb2e35991a"
}

variable "instance_type" {
  description = "type of EC2 instance to provision."
  default = "t2.micro"
}

variable "name" {
  description = "name to pass to Name tag"
  default = "Provisioned by Terraform"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  default = "s3bucket"
}

variable "lebron_bucket_name" {
  description = "Name of the Lebron S3 bucket"
  default = "lebron"
}
