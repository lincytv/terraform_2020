resource "aws_eip" "eip" {
  vpc = true
//  vpc_id = var.vpc_id.id
}

output "eip" {
  value = aws_eip.eip.public_ip
}
