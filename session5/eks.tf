module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "12.1.0"
  # insert the 4 required variables here
  cluster_name         = "test-eks"
  subnets              = [module.myvpc.public_subnet_01, module.myvpc.public_subnet_02]
  vpc_id               = module.myvpc.vpc_id
  permissions_boundary = "arn:aws:iam::482574027980:role/test"
}
