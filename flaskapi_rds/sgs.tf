resource "aws_security_group" "sg_rds" {
  name        = "${local.rds_sg_name}"
  description = "Applied to all Linux instances to provide SSH access"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(var.default_tags, map(
      "Name", "${local.rds_sg_name}"
    ))}"
}

##########
# Ingress
##########

resource "aws_security_group_rule" "ir_rds_mysql_t" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = "${var.db_clients_sg_id}"
  description              = "SSH"
  security_group_id        = "${aws_security_group.sg_rds.id}"
}

#########
# Egress
#########
resource "aws_security_group_rule" "er_base_rds" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sg_rds.id}"
}
