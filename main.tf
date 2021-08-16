provider "aws"{
    region = "ap-south-1"
}

module "vpc-subnet-configuration" {
  source = "./modules/vpc_subnet"
  mod-var-vpc-name = var.vpc_name
  mod-var-cidr-block-vpc = var.vpc_cidr_range

  mod-var-subnet-name = var.subnet_name 
  mod-var-az = var.avability_zone
  mod-var-subnet-cidr-range = var.subnet_range

  mod-var-internet-gw = var.intenet-gateway-name
 
  mod-var-routing-name = var.routing-policy-name
}

data "aws_ami" "getting-ami-id" {
  most_recent = true
  owners = ["amazon"]
  filter  {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

module "websever-setup" {
  source = "./modules/webserver"
  mod-var-aws-key-name = var.key-name
  mod-var-public_key_location  = var.public-key-location
  mod-var-vpc-id = module.vpc-subnet-configuration.vpc-instance.id    # module.{module_name}.{output_name}.{variable_name} #output_name comes from module with outputs.tf
  mod-var-ipv4-local-ingress = var.local-ipv4
  mod-var-ami = data.aws_ami.getting-ami-id.id
  mod-var-az  = var.avability_zone_instance
  mod-var-no-of-instance =  var.no-of-instance
  mod-var-subnet-id = module.vpc-subnet-configuration.subnet-id.id
}

