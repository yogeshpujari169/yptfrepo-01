#create s3 bucket with morethan 6chrs
resource "aws_s3_bucket" "objstore" {
  bucket = var.bname
}

variable "bname" {
  description = "supply name for s3 bucket"
  type = string
  validation {
    condition = length(var.bname) > 5
    error_message = "s3 bucket name must be morethan 6chrs-terminating...."
  }
}