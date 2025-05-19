resource "aws_s3_bucket" "tf_state" {
  bucket = "terraform-state-bucket"
  force_destroy = true
}
