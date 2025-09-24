locals {
  instance_tags = {
    Name  = var.instance_name
    env   = var.env_name
    owner = var.owner_name
  }
}
