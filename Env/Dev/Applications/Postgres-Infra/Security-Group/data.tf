# Remote state for VPC
data "terraform_remote_state" "dev-vpc" {
  backend = "s3"

  config = {
    bucket = "otms-dev-cloud-ops-crew"
    key    = "Network_skeleton/VPC/terraform.tfstate"
    region = "us-east-2"
  }
}

# Remote state for Attendance SG
data "terraform_remote_state" "dev-attendance-sg" {
  backend = "s3"

  config = {
    bucket = "otms-dev-cloud-ops-crew"
    key    = "Applications/Attendance-App-Infra/Security-Group/terraform.tfstate"
    region = "us-east-2"
  }
}
