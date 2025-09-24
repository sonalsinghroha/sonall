variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-2"
}

variable "vpc_name" {
  description = "Name of existing VPC"
  type        = string
  default     = "dev-vpc"
}

variable "instance_name" {
  description = "Name of the Postgres instance"
  type        = string
  default     = "dev-postgres-db"
}

variable "ami_id" {
  description = "AMI ID for the Postgres instance"
  type        = string
  default     = "ami-0d9a665f802ae6227"
}

variable "instance_type" {
  description = "Instance type for the Postgres instance"
  type        = string
  default     = "t3.small"
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default     = "dev-otms-cloud-ops"
}

variable "subnet_name" {
  description = "Name of the subnet where the instance will be placed"
  type        = string
  default     = "dev-database-subnet"
}

variable "security_group_name" {
  description = "Name of the security group for Postgres instance"
  type        = string
  default     = "dev-postgres-sg"
}

variable "owner_name" {
  default     = "Sonal"
  description = "Owner name"
}

variable "env_name" {
  default     = "dev"
  description = "Environment"
}
