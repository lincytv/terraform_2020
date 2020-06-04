resource "aws_iam_user" "dev-user" {
    name = "dev-user.${count.index}"
    count = var.usercount
    path = "/system/"
}

output "username" {
  value = aws_iam_user.dev-user
}
