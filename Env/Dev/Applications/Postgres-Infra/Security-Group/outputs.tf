output "sg_id" {
  description = "The ID of the Postgres Security Group"
  value       = aws_security_group.postgres_sg.id
}

output "sg_name" {
  description = "The name of the Postgres Security Group"
  value       = aws_security_group.postgres_sg.name
}
