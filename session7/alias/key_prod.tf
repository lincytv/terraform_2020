variable key_name {
  default = "prod-webserver"
}

resource "tls_private_key" "prod_kp_prv" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "prod_kp" {
  key_name   = var.key_name
  public_key = tls_private_key.prod_kp_prv.public_key_openssh
}

output "kp" {
  value = tls_private_key.prod_kp_prv
}
