#create s3 bucket in aws
resource "aws_s3_bucket" "s3store" {
  bucket = "tcsss-${var.s3name}"
  tags = {
    Name        = "MydevProd"
    Environment = "Dev"
  }
  lifecycle {
    create_before_destroy = true #false default
  }
}
resource "aws_s3_object" "s3folder" {
  key = var.s3bfolder
  bucket = aws_s3_bucket.s3store.id
}