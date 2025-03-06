#read the content using file funtion
#used csvdecode to read vsc file and create map for_each
locals {
  vmlist = csvdecode(file("./vmlist.csv"))
}
# output "vmlist-op" {
#   value = local.vmlist
# }

# #create multiple resource using single block with mapped values
resource "aws_instance" "ec2foreach" { //from the map key will be used in resourceblock name aws_instance.ec2foreach["key"]
for_each = { for i in local.vmlist :i.env => i }
  # for_each = {
  #   "dev" = "t2.micro"
  #   "staging" = "t2.small"
  #   "prod" = "t2.large"
  # }
  ami = "ami-05b10e08d247fb927"
  #instance_type = "t2.micro"
  instance_type = "${each.value.size}"
  tags = {
    Name = "${each.value.project}-VM-demo"
    env = "${each.value.env}" //takes the from the specific key value
  }
}
