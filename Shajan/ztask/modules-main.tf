#source network module
module "net" {
  source = "../base/modules/network"
  netblock = "10.111.0.0/16"
  dbsubnetblock = "10.111.1.0/24"
  websubnetblock = "10.111.2.0/24"
}

module "sss3" {
  source = "../base/modules/storage"
  s3name = "s3demo"
}
module "ec22vm" {
  source = "../base/modules/compute"
  vmenv = "dev"
  vmsize = "t2.nano"
  vmsubnetid = module.net.vpcwsnetdata
}

output "vpcdata" {
  value = module.net
}
