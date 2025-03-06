output "vpcdata" {
  value = aws_vpc.eusVPC.id
}
output "vpcwsnetdata" {
  value = aws_subnet.euswebsubnet.id
}
output "vpcwsnetdata" {
  value = aws_subnet.euswebsubnet.cidr_block
}
output "vpcdbnetdata" {
  value = aws_subnet.eusdbsubnet.id
}
output "vpcdbnetdata" {
  value = aws_subnet.eusdbsubnet.cidr_block
}