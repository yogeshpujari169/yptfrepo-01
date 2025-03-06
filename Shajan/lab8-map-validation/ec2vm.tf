#use variable with list type
variable "vmsize" {
  description = "supply value for env dev-t2.micro...."
  type = map(string) 
  default = {
    dev = "t2.nano"
    testing = "t2.micro"
    staging = "t2.small"
    prod = "t2.large"
    }

}
variable "selectsize" {
  description = "pls select size of vm required env - dev or testing or staging or prod"
  type = string
  validation {
    condition = contains(["dev","testing","stating","prod"], var.selectsize )
    error_message = "supply only the values given - terminating"
  }
}


resource "aws_instance" "awsvm1" {
  ami = "ami-05b10e08d247fb927"
  instance_type = var.vmsize[(var.selectsize)] //"t2.micro"
  tags = {
    Name = "test - list-selection"
    env = "demo"
  }
}
