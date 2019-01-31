# Main

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "1.22.0"

  identifier = "${local.rds_name}"

  engine            = "${var.db_engine}"
  engine_version    = "${var.db_engine_ver}"
  instance_class    = "${var.db_instance}"
  allocated_storage = "${var.allocated_storage}"
  apply_immediately = "${var.apply_immediately}"

  # name     = "${local.rds_name}" # Only if database should be created
  username = "${local.db_username}"
  password = "${var.db_password}"
  port     = "${var.db_port}"

  iam_database_authentication_enabled = "${var.iam_database_authentication_enabled}"

  vpc_security_group_ids = ["${aws_security_group.sg_rds.id}"]

  maintenance_window      = "${var.maintenance_window}"
  backup_window           = "${var.backup_window}"
  backup_retention_period = "${var.backup_retention_period}"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  create_monitoring_role = "${var.create_monitoring_role}"

  monitoring_interval = "${var.monitoring_interval}"

  # monitoring_role_arn  = "${var.monitoring_role_arn}"
  monitoring_role_name = "${local.rds_name}-CW-Role"

  enabled_cloudwatch_logs_exports = "${var.enabled_cloudwatch_logs_exports}"

  tags = "${merge(
    var.default_tags, 
    map(
      "Name", "${local.rds_name}",
      "Environment", format("%s", terraform.workspace)
      )
    )
  }"

  # DB subnet group
  create_db_subnet_group = "${var.create_db_subnet_group}"
  subnet_ids             = "${var.db_subnet_ids}"

  # DB parameter group
  create_db_parameter_group = "${var.create_db_parameter_group}"
  family                    = "${local.db_parameter_group_family}"

  # DB option group
  create_db_option_group = "${var.create_db_option_group}"
  major_engine_version   = "${local.major_engine_version}"
  option_group_name      = "${local.option_group_name}"

  # Snapshot name upon DB deletion
  final_snapshot_identifier = "${local.rds_name}-final"

  # Database Deletion Protection
  deletion_protection = "${var.deletion_protection}"

  parameters = []

  options = []
}
