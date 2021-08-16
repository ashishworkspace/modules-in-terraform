provider "aws"{
    region = "ap-south-1"
}

module "vpc-subnet-configuration" {
  source = "./modules/vpc_subnet"
  mod-var-vpc-name = var.vpc_name
  mod-var-cidr-block-vpc = var.vpc_cidr_range
}