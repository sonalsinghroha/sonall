variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-2"
}

variable "sg_name" {
  type        = string
  description = "Name of the Postgres security group"
  default     = "dev-postgres-sg"
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = list(string)
    security_groups = optional(list(string), [])
  }))
}

variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = list(string)
    security_groups = optional(list(string), [])
  }))
}

variable "owner_name" {
  default     = "Sonal"
  description = "Owner name"
}

variable "env_name" {
  default     = "dev"
  description = "Environment"
}
