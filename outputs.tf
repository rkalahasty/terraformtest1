output "public_dns" {
  value = "${aws_instance.ubuntu.public_dns}"
}

output "bucket_name" {
  value = aws_s3_bucket.private_bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.private_bucket.arn
}


output "sritans_bucket_name" {
  value = aws_s3_bucket.sritans_bucket.id
}

output "sritans_bucket_arn" {
  value = aws_s3_bucket.sritans_bucket.arn
}

