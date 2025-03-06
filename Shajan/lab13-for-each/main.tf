#create multiple resource using single block with mapped values
resource "aws_instance" "ec2foreach" { //from the map key will be used in resourceblock name aws_instance.ec2foreach["key"]
  for_each = {
    "dev" = "t2.micro"
    "staging" = "t2.small"
    "prod" = "t2.large"
  }
  ami = "ami-05b10e08d247fb927"
  instance_type = "t2.micro"
  #instance_type = "${each.value}"
  tags = {
    Name = "user20VM-demo"
    size = "${each.value}" //takes the from the specific key value
  }
}
