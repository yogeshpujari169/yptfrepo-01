#create depends_on resources
# first create local_file then s3 bucket
resource "aws_s3_bucket" "zyx" {   //aplphabetically created last
  bucket = "tesing-s3-bucket"
  depends_on = [ local_file.afile ]
}
resource "local_file" "afile" {
  content = "some content"
  filename = "test.txt"
}