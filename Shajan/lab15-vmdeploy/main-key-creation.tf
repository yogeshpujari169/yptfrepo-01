
# Generate Private Key SSH-KEYGEN
resource "tls_private_key" "prodkey" {
  algorithm = "RSA"
  rsa_bits  = 2048
}


# Create AWS Key Pair
resource "aws_key_pair" "ec2-prdkey_key" {
  key_name   = "ec2-prod-250-key"
  public_key = tls_private_key.prodkey.public_key_openssh

  tags = {
    Name = "ec2-dev-tls-key"
  }
}

# Save the Private Key to a .pem File
resource "local_file" "prodkey_pem" {
  filename        = "prod-key.pem"
  content         = tls_private_key.prodkey.private_key_pem
  file_permission = "0400" # Ensure the file is only readable by the owner
}

 output "private_key_path" {
   value = local_file.prodkey_pem.filename
}