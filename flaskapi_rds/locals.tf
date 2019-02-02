locals {
  rds_name    = "${terraform.workspace}-rds-${var.db_engine}"
  db_username = "${var.db_adm_username == "" ? "${terraform.workspace}rdsadmin" : var.db_adm_username}"

  db_subnet_group_name = "${
    (var.create_db_subnet_group == true || var.db_subnet_group == "") ? "${terraform.workspace}-rds-subnet-grp" :
    (var.create_db_subnet_group == true || var.db_subnet_group != "" ? var.db_subnet_group : "")
  }"

  rds_sg_name       = "${terraform.workspace}-rds-sg"
  option_group_name = "${terraform.workspace}-rds-${var.db_engine}-og"

  engine_parts              = ["${split(".", var.db_engine_ver)}"]
  parts_list                = ["${local.engine_parts[0]}", "${local.engine_parts[1]}"]
  major_engine_version      = "${join(".", local.parts_list)}"
  family_list               = ["${var.db_engine}", "${local.major_engine_version}"]
  db_parameter_group_family = "${join("", local.family_list)}"

  create_monitoring_role = "${
    var.monitoring_interval == 0 ? false : var.create_monitoring_role ? true : false
    }"

  monitoring_role_name = "${var.monitoring_interval == 0 ? "" : "${local.rds_name}-CW-Role"}"
}
