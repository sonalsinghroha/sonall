# Postgres Security Group
resource "aws_security_group" "postgres_sg" {
  name        = var.sg_name
  description = "Postgres Security Group created from variables"
  vpc_id      = data.terraform_remote_state.dev-vpc.outputs["vpc-id"]
  tags        = local.sg_tags
}

# Ingress rules from CIDR blocks
resource "aws_security_group_rule" "ingress_cidr" {
  for_each = { for idx, rule in var.ingress_rules : idx => rule if length(rule.cidr_blocks) > 0 }

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  security_group_id = aws_security_group.postgres_sg.id
  cidr_blocks       = each.value.cidr_blocks
}

# Ingress rules from other security groups
resource "aws_security_group_rule" "ingress_from_sg" {
  for_each = { for idx, rule in var.ingress_rules : idx => rule if length(rule.security_groups) > 0 }

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  security_group_id = aws_security_group.postgres_sg.id

  # Map SG names from terraform.tfvars to actual SG IDs using remote state outputs
  source_security_group_id = lookup(
    {
      "dev-attendance-sg" = data.terraform_remote_state.dev-attendance-sg.outputs["sg_id"]
    },
    each.value.security_groups[0],
    null
  )
}

# Egress rules
resource "aws_security_group_rule" "egress_rules" {
  for_each = { for idx, rule in var.egress_rules : idx => rule }

  type              = "egress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  security_group_id = aws_security_group.postgres_sg.id
  cidr_blocks       = each.value.cidr_blocks
}
