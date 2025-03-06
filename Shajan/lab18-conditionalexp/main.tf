variable "vmsize" {
  description = "enter p for production, d for dev vm"
}

#cretae resource
resource "aws_instance" "ec2" {
  ami =  "ami-05b10e08d247fb927"
  #instance_type = var.vmsize == "p" ? "t2.micro" : "t2.nano" //"t2.micro"
  instance_type = var.vmsize == "p" ? "t2.micro" : (var.vmsize == "d" ? "t2.nano" : "t2.small")
  tags = {
    Name = "demovm"
  }
}