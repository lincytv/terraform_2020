
resource "aws_instance" "frontend-web" {
    ami = var.instance_ami_us_east_1
    #instance_type = var.inst_type["us-west-2"]
    instance_type = var.list[0]
}

variable "list" {
  type = list
  default = ["t2.micro", "t2.small", "t2.large"]
}

variable "inst_type" {
  type =  map
  default = {
    "us-east-1" = "t2.micro"
    "us-west-2" = "t2.nano"
    "ap-southeast-1" = "t2.small"
  }
}
