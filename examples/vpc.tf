# Verify that provided VPC has DNS features enabled

variable "vpc_id" {
  type = string
}

data "aws_vpc" "vpc" {
  id = var.vpc_id
}

module "verify_vpc" {
  source = "../"

  match = data.aws_vpc.vpc.enable_dns_support && data.aws_vpc.vpc.enable_dns_hostnames
  error = "VPC ${var.vpc_id} must have DNS support (got ${data.aws_vpc.vpc.enable_dns_support}) and DNS hostnames (got ${data.aws_vpc.vpc.enable_dns_hostnames}) enabled"
}

provider "aws" {
  region = "us-east-1"
}
