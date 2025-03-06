#use variable with list type
variable "vmsize" {
  description = "supply value for env dev-t2.micro...."
  type = list 
  default = ["t2.nano","t2.micro","t2.small","t2.large"]
}
variable "selectsize" {
  description = "pls select size of vm required env type 1 - t2.nano, 2 - t2.micro, 3- t2.small, 4 - t2.large"
  type = number
  validation {
    condition = (var.selectsize) < 5
    error_message = "supply value 1 - 4 only"
  }
}


resource "aws_instance" "awsvm1" {
  ami = "ami-05b10e08d247fb927"
  instance_type = var.vmsize[(var.selectsize)-1] //"t2.micro"
  tags = {
    Name = "test - list-selection"
    env = "demo"
  }
}
