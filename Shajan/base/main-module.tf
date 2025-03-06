
#source module from module folder
module "netmod" {
  source = "./modules/network"
  netblock = "10.129.0.0/16"
  websubnetblock = "10.129.111.0/24"
  dbsubnetblock = "10.129.222.0/24"
}

module "vmmod" {
  source = "./modules/compute"
  vmsize = "t2.micro"
  vmsubnetid = module.netmod.vpcwsnetdata
  vmenv = "testMODVM"
}
module "stmod" {
  source = "./modules/storage"
  s3name = "demos3333mod"
}

output "netout" {
 value = module.netmod
}

output "vmout" {
  value = module.vmmod
}
output "stout" {
  value = module.stmod
}