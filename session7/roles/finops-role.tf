data "aws_caller_identity" "current" {}

data "template_file" "finops-role" {
  template = file("./templetes/finops.tpl")
  vars = {
    aws_account_id = data.aws_caller_identity.current.account_id
  }
}
resource "aws_iam_role" "finops-role" {
  name               = "finop-role"
  description        = "finops role for account"
  assume_role_policy = file("./aumerole.json")
  //policy      = template_file.finops-role //file("./finops-role.json")
}

resource "aws_iam_policy" "finops" {
  name   = "finops-policy"
  policy = data.template_file.finops-role.rendered
}

resource "aws_iam_role_policy_attachment" "finopsrole-attach" {
  role       = aws_iam_role.finops-role.name
  policy_arn = aws_iam_policy.finops.arn
}

output "role_name" {
  value = data.template_file.finops-role.id
}
