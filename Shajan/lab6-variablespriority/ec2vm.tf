#varibale,terraform.tfvars,*.auto.tfvars,-var-file/-var
variable "vmsize" {
  description = "supply value for env dev-t2.micro...."
}
variable "vmname" {
  description = "vm tag to use"
  default = "name-from-vars-default-block"
}

resource "aws_instance" "awsvm" {
  ami = "ami-05b10e08d247fb927"
  instance_type = var.vmsize //"t2.micro"
  tags = {
    Name = var.vmname
    env = "demo"
  }
}