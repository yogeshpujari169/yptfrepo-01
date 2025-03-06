provider "tls" {
  # Configuration options
}
# Generate Private Key
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create AWS Key Pair
resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2-dev-250-key"
  public_key = tls_private_key.example.public_key_openssh

  tags = {
    Name = "ec2-tls-key"
  }
}

# Save the Private Key to a .pem File
resource "local_file" "example_pem" {
  filename        = "ec2-dev-250-key.pem"
  content         = tls_private_key.example.private_key_pem
  file_permission = "0400" # Ensure the file is only readable by the owner
}

output "private_key_path" {
  value = local_file.example_pem.filename
}
