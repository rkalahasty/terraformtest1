provider "aws" {
  region = var.aws_region
}

resource "null_resource" "delete_buckets" {
  provisioner "local-exec" {
    command = <<EOT
      for bucket in $(aws s3api list-buckets --query "Buckets[].Name" --output text); do
        aws s3 rb s3://$bucket --force
      done
    EOT
  }
}
