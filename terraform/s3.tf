##resource "aws_s3_bucket" "tf_state" {
##  bucket = "terraform-state-bucket"
##  force_destroy = true
##}
#resource "random_id" "bucket_suffix" {
#  byte_length = 4
#}
#
#resource "aws_s3_bucket" "test_bucket" {
#  bucket = "my-bucket-${random_id.bucket_suffix.hex}"
#  force_destroy = false
#}
#
#resource "aws_s3_bucket" "tf_state" {
#  bucket = "terraform-state-bucket-${random_id.bucket_suffix.hex}"
#  force_destroy = true
#}
