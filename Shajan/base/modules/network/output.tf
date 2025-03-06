output "vpcdata" {
  value = aws_vpc.eusVPC.id
}
output "vpcwsnetdata" {
  value = aws_subnet.euswebsubnet.id
}
output "vpcwsnetcidr" {
  value = aws_subnet.euswebsubnet.cidr_block
}
output "vpcdbnetdata" {
  value = aws_subnet.eusdbsubnet.id
}
output "vpcdbnetcidr" {
  value = aws_subnet.eusdbsubnet.cidr_block
}