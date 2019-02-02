variable "region" {
  description = "AWS Region"
  default     = "eu-west-1"
}

variable "account_id" {
  description = "AWS Account ID"
  default     = ""
}

variable "remote_state_s3" {
  default = "xyz-tfm-state"
}

variable "default_tags" {
  type        = "map"
  description = "Map of default tags applied to all resources"

  default = {
    Github-Repo = "rb-org/tfm-aws-database"
    Terraform   = "true"
  }
}

variable "mysql_rds_password" {}

# Log exports
variable "mysql_log_exports" {
  description = "Valid values audit, error, general, slowquery"
  default     = ["error"]
}

variable "mssql_log_exports" {
  description = "Valid values  agent, dump, error, trace"
  default     = ["agent", "error"]
}

# SSM 
variable "create_ssm_service_role" {
  default = false
}
