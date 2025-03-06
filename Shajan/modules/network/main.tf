
#create a subnet in the above vpc
resource "aws_subnet" "euswebsubnet" {
  vpc_id     = aws_vpc.eusVPC.id
  cidr_block = var.websubnetblock
  tags = {
    Name = "eastUS web subnet"
  }
}

resource "aws_subnet" "eusdbsubnet" {
  vpc_id     = aws_vpc.eusVPC.id
  cidr_block = var.dbsubnetblock
  tags = {
    Name = "eastUS DB subnet"
  }
}

#create a VPC with 10.x.0.0/16
resource "aws_vpc" "eusVPC" {
  cidr_block = var.netblock
  tags = {
    Name = "eastUSVNetwork"
  }
}

