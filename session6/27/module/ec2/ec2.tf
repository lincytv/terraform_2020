resource "aws_instance" "ser01" {
  ami           = "ami-068663a3c619dd892"
  instance_type = var.instance_type
  key_name      = "myserver"
  subnet_id     = var.subnet_id
  tags = {
    Name = "server01"
  }
}

output "instance_id" {
  value = aws_instance.ser01.id
}

output "public_ip" {
  value = aws_instance.ser01.public_ip
}
