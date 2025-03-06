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
  #access_key = "AKIA2XSAEMJ7KCIAA6NS"
  #secret_key = "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"
  profile = "default"
}
provider "local" {}
provider "random" {}