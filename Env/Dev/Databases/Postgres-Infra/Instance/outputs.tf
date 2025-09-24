output "instance_id" {
  description = "ID of the Postgres instance"
  value       = aws_instance.postgres.id
}

output "instance_private_ip" {
  description = "Private IP of the Postgres instance"
  value       = aws_instance.postgres.private_ip
}

output "instance_subnet_id" {
  description = "Subnet ID where the Postgres instance is placed"
  value       = aws_instance.postgres.subnet_id
}

output "instance_security_groups" {
  description = "Security groups attached to the Postgres instance"
  value       = aws_instance.postgres.vpc_security_group_ids
}
