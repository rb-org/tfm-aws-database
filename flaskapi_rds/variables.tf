# Variables
variable "vpc_id" {}

variable "multi_az" {
  default = false
}

variable "db_subnet_ids" {
  type = "list"
}

variable "db_subnet_group" {
  default = ""
}

variable "allocated_storage" {
  default = 5
}

variable "db_engine" {
  default = "mysql"
}

variable "db_engine_ver" {}

variable "major_engine_version" {}

variable "db_instance" {
  default     = "db.t2.medium"
  description = "See https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html"
}

variable "db_port" {
  default = "3306"
}

variable "db_password" {}

variable "apply_immediately" {
  default = true
}

variable "create_monitoring_role" {
  default = true
}

variable "iam_database_authentication_enabled" {
  description = "See https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html"
  default     = false
}

variable "create_db_option_group" {
  default = false
}

variable "backup_retention_period" {
  default = 3
}

variable "maintenance_window" {
  default = "Mon:00:00-Mon:03:00"
}

variable "backup_window" {
  default = "03:00-06:00"
}

variable "monitoring_interval" {
  default     = 0
  description = "0 = no monitoring. Valid values - 0, 1, 5, 10, 15, 30, 60"
}

variable "create_db_subnet_group" {
  default = false
}

variable "create_db_parameter_group" {
  default = true
}

variable "db_clients_sg_id" {}

variable "deletion_protection" {
  default = true
}

variable "db_parameter_group_family" {}

variable "default_tags" {
  type = "map"
}

variable "enabled_cloudwatch_logs_exports" {
  type = "list"
}

variable "storage_encrypted" {
  description = "Encrypt database at rest"
  default     = true
}
