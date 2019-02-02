# Outputs

output "flaskapi_rds_instance_endpoint" {
  value = "${module.flaskapi_rds.flaskapi_rds_instance_endpoint}"
}
