provider "local" {}
provider "random" {}

resource "local_file" "myfiles" {
  content  = "Welcome to Terraform"
  filename = "file1.txt"
}

resource "local_file" "myfiles2" {
  content  = "Welcome to Terraform -------------"
  filename = "file2.txt"
}


resource "random_password" "password" {
  length  = 15
  special = true
  # override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "random_pet" "namegen" {
  prefix    = "Mr."
  length    = 3
  separator = "@"
}

/*
2 cd base
   3 terraform fmt
   4 terraform fmt
   5 terraform validate
   6 terraform init
   7 terraform validate
   8 terraform plan
   9 terraform apply
  10 terraform apply -auto-approve
*/

