#output "vpc_id" {
#  value = aws_vpc.main.id
#}
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

#output "s3_bucket_name" {
#  description = "The name of the S3 bucket"
#  value       = aws_s3_bucket.test_bucket.bucket
#}

output "todoapp_service_name" {
  description = "The name of the Kubernetes Service for todoapp"
  value       = kubernetes_service.todoapp_service.metadata[0].name
}
