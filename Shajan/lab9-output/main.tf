#lab for output variable
#create vm
resource "aws_instance" "awsvm" {
  ami = "ami-05b10e08d247fb927"
  instance_type = "t2.micro"
  tags = {
    Name = "user20VM-demo"
    env = "demo"
  }
}
output "vmip" {
  value = aws_instance.awsvm.public_ip
}
output "vmid" {
  value = aws_instance.awsvm.id
}
output "vmalldata" {
  value = [aws_instance.awsvm.id,aws_instance.awsvm.public_ip]
}
output "vmddd" {
  value = aws_instance.awsvm.*
}
resource "local_file" "vmdata" {
  filename = "vmdata.txt"
  content = <<-EOF
  The new VMs ID is ${aws_instance.awsvm.id}
  the public of the vm ${aws_instance.awsvm.public_ip}
  EOF
}

