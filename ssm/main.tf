resource "aws_ssm_parameter" "rds_db_database" {
  name      = "/${terraform.workspace}/flaskapi/rds/database/name"
  type      = "SecureString"
  value     = "people"
  overwrite = false

  lifecycle {
    ignore_changes = ["value"]
  }
}

resource "aws_ssm_parameter" "rds_db_endpoint" {
  name      = "/${terraform.workspace}/flaskapi/rds/database/endpoint"
  type      = "SecureString"
  value     = "${var.rds_endpoint}"
  overwrite = false
}

resource "aws_ssm_parameter" "user_name" {
  name      = "/${terraform.workspace}/flaskapi/rds/database/user_name"
  type      = "SecureString"
  value     = "flask"
  overwrite = false

  lifecycle {
    ignore_changes = ["value"]
  }
}

resource "aws_ssm_parameter" "user_password" {
  name      = "/${terraform.workspace}/flaskapi/rds/database/user_pwd"
  type      = "SecureString"
  value     = "changeme"
  overwrite = false

  lifecycle {
    ignore_changes = ["value"]
  }
}

resource "aws_ssm_parameter" "admin_name" {
  name      = "/${terraform.workspace}/flaskapi/rds/database/adm_name"
  type      = "SecureString"
  value     = "${var.db_adm_username}"
  overwrite = false
}

resource "aws_ssm_parameter" "admin_password" {
  name      = "/${terraform.workspace}/flaskapi/rds/database/adm_pwd"
  type      = "SecureString"
  value     = "changeme"
  overwrite = false

  lifecycle {
    ignore_changes = ["value"]
  }
}
