#create s3 bucket in aws
resource "aws_s3_bucket" "s3store" {
  bucket = "s3bucket-tcsss-demo1"
  tags = {
    Name        = "My devProd bucket"
    Environment = "Dev"
  }
  lifecycle {
    create_before_destroy = true #false default
  }

}