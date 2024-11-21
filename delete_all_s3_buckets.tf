provider "aws" {
  region = var.aws_region
}

data "aws_s3_buckets" "all" {}

resource "null_resource" "delete_buckets" {
  count = length(data.aws_s3_buckets.all.names)

  provisioner "local-exec" {
    command = <<EOT
      aws s3 rb s3://${data.aws_s3_buckets.all.names[count.index]} --force
    EOT
  }
}
