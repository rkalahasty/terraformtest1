output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = aws_eks_cluster.main.name
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

output "rohans_ec2_id" {
  description = "ID of Rohan's EC2 instance"
  value       = aws_instance.rohans_ec2.id
}

