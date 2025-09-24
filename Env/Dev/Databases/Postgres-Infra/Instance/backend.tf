terraform {
  backend "s3" {
    bucket  = "otms-dev-cloud-ops-crew"
    key     = "Databases/Postgres-Infra/Instance/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
}
