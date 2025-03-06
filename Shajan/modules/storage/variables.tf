#s3 bucket name
variable "s3name" {
  description = "Supply the value for s3 bucket name"
}
variable "s3bfolder" {
  description = "supply name for the folder"
  default =  "devimages"
}