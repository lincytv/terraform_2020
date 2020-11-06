data "template_file" "ec2_user_data_healthcheck" {
  template = file(
    "${path.module}/../../scripts/user_data/ec2_user_data_healthcheck.sh",
  )

  vars = {
    sns_arn       = data.terraform_remote_state.sns.outputs.user_data
    instance_name = "${var.name_prefix}-${var.bastion_module_name}"
    bucket_name   = var.s3_userdata_bucket
  }
}
