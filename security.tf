resource "aws_security_group" "wordpres_security_group" {
  name        = "wordpres_security_group"
  description = "control access to the wordpress server"
}

resource "aws_security_group_rule" "ingress_http" {
  security_group_id = "${aws_security_group.wordpres_security_group.id}"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
}

resource "aws_security_group_rule" "ingress_https" {
  security_group_id = "${aws_security_group.wordpres_security_group.id}"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
}

resource "aws_security_group_rule" "ingress_reply" {
  security_group_id = "${aws_security_group.wordpres_security_group.id}"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "tcp"
  from_port         = 1024
  to_port           = 65535
}

resource "aws_security_group_rule" "egress_reply" {
  security_group_id = "${aws_security_group.wordpres_security_group.id}"
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "all"
  from_port         = 0
  to_port           = 0
}

resource "aws_security_group_rule" "ingress_ssh" {
  security_group_id = "${aws_security_group.wordpres_security_group.id}"
  type              = "ingress"
  cidr_blocks       = ["${var.local_ip}/32"]
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
}
