resource "aws_instance" "myec2" {
  ami           = "ami-068663a3c619dd892"
  instance_type = "t2.micro"
  key_name      = "myserver"

  provisioner "file" {
    source      = "./script.sh"
    destination = "/tmp/script.sh"
    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("./myserver.pem")
    }

  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh"
    ]
    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("./myserver.pem")
    }
  }
}
