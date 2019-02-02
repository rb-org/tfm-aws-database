resource "aws_iam_service_linked_role" "ssm_maintenance_service_role" {
  aws_service_name = "ssm.amazonaws.com"
}
