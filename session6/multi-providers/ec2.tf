module "webserver01" {
  source        = "./modules/ec2"
  instance_type = "t2.micro"
}
module "webserver02" {
  source        = "./modules/ec2"
  instance_type = "t2.small"
  providers = {
    aws = aws.oregon
  }
}

output "server01_ip" {
  value = module.webserver01.ip
}

output "server02_ip" {
  value = module.webserver02.ip
}
