resource "aws_eip" "eip" {
  vpc = true
//  vpc_id = var.vpc_id.id
}
output "eip" {
  value = aws_eip.eip.public_ip
}
resource "aws_s3_bucket" "lincymys3" {
    bucket = "lincymys3"
}

output "s3_url" {
  value = aws_s3_bucket.lincymys3.bucket_regional_domain_name 
}
