resource "aws_iam_service_linked_role" "ssm_maintenance_service_role" {
  count            = "${local.create_ssm_service_role}"
  aws_service_name = "ssm.amazonaws.com"
}
