output "vmip" {
  value = aws_instance.awsvm.public_ip
}
output "vmid" {
  value = aws_instance.awsvm.id
}
