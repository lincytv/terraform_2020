variable key_name {
  default = "dev-webserver"
}

resource "tls_private_key" "dev_kp_prv" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "dev_kp" {
  key_name   = var.key_name
  public_key = tls_private_key.dev_kp_prv.public_key_openssh
}

output "kp" {
  value = tls_private_key.dev_kp_prv
}
