# resource "aws_vpc" "myVPC" {
#   cidr_block = "10.222.0.0/16"
#   tags = {
#     Name = "vpc-eastus"
#   }
# }
# resource "aws_subnet" "mywebsn" {
#   vpc_id = aws_vpc.myVPC.id
#   cidr_block = "10.222.1.0/24"
# }
# resource "aws_subnet" "mydbsn" {
#   vpc_id = aws_vpc.myVPC.id
#   cidr_block = "10.222.2.0/24"
# }
#"vpc-0f5614bede8a7eb2c"
data "aws_vpc" "ankvpc" {
  #id = "vpc-0f5614bede8a7eb2c"
  filter {
name = "tag:Name"
values = ["ank-VPC-Prod"]

  }
}

output "ankvpcdata" {
  value = data.aws_vpc.ankvpc
}
resource "aws_subnet" "myappsn" {
  vpc_id = data.aws_vpc.ankvpc.id
  cidr_block = "10.120.30.0/24"
}

# data "aws_s3_bucket" "binfo" {
# #   filter {
# # name = "tag:Name"
# # values = ["ank-VPC-Prod"]

# #   }
# }
data "aws_s3_bucket" "binfo" {
  bucket = "tcstfcalss123"
}
resource "aws_s3_object" "s3folder" {
  bucket = data.aws_s3_bucket.binfo.id
  key = "testfolder"
}
output "s3out" {
  value = data.aws_s3_bucket.binfo
}