output "vpc_id" {
  value = aws_vpc.elk_internal.id
}

output "public_subnet_01" {
  value = aws_subnet.public_subnet_01.id
}

output "public_subnet_02" {
  value = aws_subnet.public_subnet_02.id
}
output "private_subnet_01" {
  value = aws_subnet.private_subnet_01.id
}

output "private_subnet_02" {
  value = aws_subnet.private_subnet_02.id
}
