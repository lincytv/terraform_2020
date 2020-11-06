module "ec2instance" {
  source        = "./modules/ec2"
  instance_type = "t2.large"
}

# module "ec2instance" {
#   source        = "git::https://github.com/lincytv/terraformdemo/terraformdemo.git?ref=v1.2"
#   instance_type = "t2.large"
# }
