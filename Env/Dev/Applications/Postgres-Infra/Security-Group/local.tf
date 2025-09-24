locals {
  sg_tags = {
    Name  = var.sg_name
    env   = var.env_name
    owner = var.owner_name
  }
}
