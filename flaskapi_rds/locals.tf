locals {
  rds_name             = "${terraform.workspace}-rds-${var.db_engine}"
  db_username          = "${terraform.workspace}-rds-admin"
  db_subnet_group_name = "${terraform.workspace}-rds-subnet-grp"
  rds_sg_name          = "${terraform.workspace}-rds-sg"
  option_group_name    = "${terraform.workspace}-rds-${var.db_engine}-og"

  engine_parts              = ["${split(".", var.db_engine_ver)}"]
  parts_list                = ["${local.engine_parts[0]}", "${local.engine_parts[1]}"]
  major_engine_version      = "${join(".", local.parts_list)}"
  family_list               = ["${var.db_engine}", "${local.major_engine_version}"]
  db_parameter_group_family = "${join("", local.family_list)}"
}

# db_engine = "mysql" # aurora-mysql ver = 5.7.12


# db_engine_ver = "5.7.23"


# major_engine_version = "5.7" # Option group parameter


# db_parameter_group_family = "mysql5.7"

