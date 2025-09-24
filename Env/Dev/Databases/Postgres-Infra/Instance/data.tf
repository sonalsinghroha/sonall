# Remote state for VPC
data "terraform_remote_state" "dev-vpc" {
  backend = "s3"
  config = {
    bucket = "otms-dev-cloud-ops-crew"
    key    = "Network_skeleton/VPC/terraform.tfstate"
    region = "us-east-2"
  }
}

# Remote state for Subnets
data "terraform_remote_state" "Subnets" {
  backend = "s3"
  config = {
    bucket = "otms-dev-cloud-ops-crew"
    key    = "Network_skeleton/Subnets/terraform.tfstate"
    region = "us-east-2"
  }
}

# Remote state for Postgres Security Group
data "terraform_remote_state" "sg_name" {
  backend = "s3"
  config = {
    bucket = "otms-dev-cloud-ops-crew"
    key    = "Databases/Postgres-Infra/Security-Group/terraform.tfstate"
    region = "us-east-2"
  }
}

# Fetch latest Ubuntu 22.04 AMI if AMI ID not provided
data "aws_ami" "ubuntu_22" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
