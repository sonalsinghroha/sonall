resource "aws_instance" "postgres" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [data.terraform_remote_state.sg_name.outputs.sg_id]
  subnet_id              = data.terraform_remote_state.Subnets.outputs.subnet_ids["dev-database-subnet"]

  tags = local.instance_tags

  root_block_device {
    volume_size           = 20
    volume_type           = "gp2"
    delete_on_termination = true
    tags                  = local.instance_tags
  }

  # Ensure the instance initializes before proceeding
  credit_specification {
    cpu_credits = "standard"
  }

  # Disable public IP for private instance
  associate_public_ip_address = false
}
