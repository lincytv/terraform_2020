# associate eip to the instances
resource "aws_eip_association" "eip_assoc" {
  instance_id = aws_instance.web_frontend_output.id
  allocation_id = aws_eip.eip.id

}
