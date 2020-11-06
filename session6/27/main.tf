module "myvpc" {
  source = "./module/vpc"
}

module "myec2" {
  source        = "./module/ec2/"
  instance_type = "t2.micro"
  subnet_id     = module.myvpc.public_subnet_01
}

output id {
  value = module.myec2.instance_id
}
