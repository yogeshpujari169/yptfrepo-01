
resource "aws_instance" "awsvm" {
  ami = "ami-05b10e08d247fb927"
  instance_type = "t2.micro"
  tags = {
    Name = "user20VM-demo"
    env = "demo"
  }
}

