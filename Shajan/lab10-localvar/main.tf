#create s3 bucket based on project-env-"bucket"
variable "proj" {
  description = "supply projectname"
}
# variable "env" {
#   description = "supply value for env"
# }
locals {
 bucket-name = "tcs-${var.proj}-${(formatdate("YY-MM-DD-hh-mm", timestamp()))}"
  newname = "test-name"
}
resource "aws_s3_bucket" "projbucket" {
  count = 3
  bucket = "${local.bucket-name}-${count.index}"
  #bucket = "tcs-${var.proj}-${var.env}-bucket"
  tags = {
    Name = local.bucket-name
    #env = "${var.env}-env"
    project = "${var.proj}-proj"
  }
}