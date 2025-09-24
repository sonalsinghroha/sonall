aws_region = "us-east-2"
sg_name    = "dev-postgres-sg"
owner_name = "Sonal"
env_name   = "dev"

# Ingress rules
ingress_rules = [
  {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["10.0.0.0/16"]
    security_groups = []
  },
  {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    cidr_blocks     = []
    security_groups = ["dev-attendance-sg"]
  }
]

# Egress rules
egress_rules = [
  {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = []
  }
]
