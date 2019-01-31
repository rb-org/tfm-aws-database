module "flaskapi_rds" {
  source = "./flaskapi_rds"

  db_engine                 = "mysql"                     # aurora-mysql ver = 5.7.12
  db_engine_ver             = "5.7.23"
  major_engine_version      = "5.7"                       # Option group parameter
  db_parameter_group_family = "mysql5.7"
  db_instance               = "db.t2.medium"
  db_password               = "${var.mysql_rds_password}"

  # Remote state references
  db_subnet_ids   = "${data.terraform_remote_state.flaskapi_base.database_subnets_ids}"
  db_subnet_group = "${data.terraform_remote_state.flaskapi_base.database_subnet_group}"
  vpc_id          = "${data.terraform_remote_state.flaskapi_base.vpc_id}"

  # ssh_sg_id        = "${data.terraform_remote_state.flask_api_base.ssh_sg_id}"
  db_clients_sg_id = "${data.terraform_remote_state.flaskapi_base.db_clients_sg_id}"

  # Tags
  default_tags = "${var.default_tags}"
}
