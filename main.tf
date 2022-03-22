terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = "~>1.0"
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
  default_tags {
    tags = {
        owner = "semen_goryunov@epam.com"
    }
  }
}


data "aws_vpcs" "epam_vpcs" {}

data "aws_vpc" "epam_vpc" {
  count = length(data.aws_vpcs.epam_vpcs.ids)
  id    = tolist(data.aws_vpcs.epam_vpcs.ids)[count.index]
}

data "aws_subnet_ids" "epam_subnets" {
  vpc_id = data.aws_vpc.epam_vpc[0].id
}

data "aws_subnet" "epam_subnet" {
  for_each = data.aws_subnet_ids.epam_subnets.ids
  id       = each.value
}

data "aws_security_groups" "epam_sgroups" {
}