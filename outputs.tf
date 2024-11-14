output "public_dns" {
  value = "${aws_instance.ubuntu.public_dns}"
}

output "bucket_name" {
  value = aws_s3_bucket.s3bucket.id
}

output "my_bucket_name" {
  value = aws_s3_bucket.my_s3_bucket.id
}

output "unique_bucket_name" {
  value = aws_s3_bucket.unique_bucket.id
  description = "The name of the unique private bucket"
}
