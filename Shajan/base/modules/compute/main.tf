#create require vars, resource and outputs

resource "aws_instance" "awsvm" {
  ami = "ami-05b10e08d247fb927"
  instance_type = var.vmsize
  subnet_id = var.vmsubnetid
  tags = {
    Name = "user20VM-${var.vmenv}"
    env = var.vmenv
  }
}

