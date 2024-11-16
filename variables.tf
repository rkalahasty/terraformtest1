variable "aws_region" {
  description = "AWS region"
  default     = "us-west-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  default     = "my-eks-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version"
  default     = "1.27"
}

variable "instance_type" {
  description = "Instance type for the EKS nodes"
  default     = "t3.medium"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  default     = "s3bucket"
}

variable "sritans_bucket_name" {
  description = "Name of Sritan's S3 bucket"
  default     = "sritans-bucket"
}

