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
