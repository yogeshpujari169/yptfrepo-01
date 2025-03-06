terraform {
  #required_version = "1.8.0" //terraform version
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "=5.88.0" #plugin version
    }
     local = {
      source = "hashicorp/local"
      version = "2.5.2"
    }
  }
}


provider "aws" {
  region     = "us-east-1"
  profile = "default"
}
provider "local" {}
provider "random" {}
provider "tls" {
  # Configuration options
}