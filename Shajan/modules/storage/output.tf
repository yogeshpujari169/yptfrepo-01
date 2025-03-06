output "s3name" {
  value = aws_s3_bucket.s3store.bucket
}
output "s3folderout" {
  value = aws_s3_object.s3folder.key
}