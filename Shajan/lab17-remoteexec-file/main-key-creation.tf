
# Generate Private Key SSH-KEYGEN
resource "tls_private_key" "prodkey" {
  algorithm = "RSA"
  rsa_bits  = 2048
}


# Create AWS Key Pair
resource "aws_key_pair" "ec2-prdkey_key" {
  key_name   = "aks-ec2-provisioner-key"
  public_key = tls_private_key.prodkey.public_key_openssh

  tags = {
    Name = "aks-ec2-provisioner-key"
  }
}

# Save the Private Key to a .pem File
resource "local_file" "prodkey_pem" {
  filename        = "aks-ec2-provisioner-key.pem"
  content         = tls_private_key.prodkey.private_key_pem
  file_permission = "0400" # Ensure the file is only readable by the owner
}

 output "private_key_path" {
   value = local_file.prodkey_pem.filename
}

#file provisioner
resource "aws_instance" "ec2vmfile" {
  ami = "ami-05b10e08d247fb927"
  instance_type = "t2.micro"
  #subnet_id = "subnet-e8952fa5"
  key_name = "aks-ec2-provisioner-key"
  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
    private_key = file("./aks-ec2-provisioner-key.pem") //if pem file is ready
  }
    provisioner "file" { //use file provisioner first if you use in remote exec
    source = "./deployhttpd.sh"
    destination = "/tmp/deployhttpd.sh"
  }
    provisioner "remote-exec" {
    inline = [
      "echo 'starting echo 10'",
      "sleep 10", 
      "chmod +x /tmp/deployhttpd.sh", //make sure file provisioner block first the remote-exec 
      "/tmp/deployhttpd.sh"
    ]
  }


 tags = {
   Name = "AKS-VM-File"
 }

}
output "vmpubip" {
  value = aws_instance.ec2vmfile.public_ip
}