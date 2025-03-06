
#create a subnet in the above vpc
resource "aws_subnet" "euswebsubnet" {
  vpc_id     = aws_vpc.eusVPC.id
  cidr_block = "10.30.1.0/24"
  tags = {
    Name = "eastUS web subnet"
  }
}

resource "aws_subnet" "eusdbsubnet" {
  vpc_id     = aws_vpc.eusVPC.id
  cidr_block = "10.30.2.0/24"
  tags = {
    Name = "eastUS DB subnet"
  }
}

#create a VPC with 10.x.0.0/16
resource "aws_vpc" "eusVPC" {
  cidr_block = "10.30.0.0/16"
  tags = {
    Name = "eastUSVNetwork"
  }
}
#terraform plan
#terraform apply