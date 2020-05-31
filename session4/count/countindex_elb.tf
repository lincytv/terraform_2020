

resource "aws_iam_user" "ebl_name"{
  name = var.elb_name[count.index]
  count = 3
  path = "/system/"
}
