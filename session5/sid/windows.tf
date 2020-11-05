resource "aws_instance" "win" {
  ami                  = "ami-05bb2dae0b1de90b3"
  instance_type        = "t2.medium"
  iam_instance_profile = "EC2-S3-SSM-ECR"
  tags = {
    Name = "Win2019-SRV"
  }
}
