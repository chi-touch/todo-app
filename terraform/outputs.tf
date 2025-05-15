output "s3_bucket_name" {
  value = aws_s3_bucket.bucket.id
}

output "iam_user_name" {
  value = aws_iam_user.user.name
}

output "vpc_id" {
  value = aws_vpc.main.id
}
