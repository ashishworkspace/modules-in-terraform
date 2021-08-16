vpc_name = "terraform-vpc"
vpc_cidr_range = "192.168.0.0/16"


subnet_name = "terraform-subnet"
avability_zone = "ap-south-1a"
subnet_range = "192.168.1.0/24"

intenet-gateway-name = "terraform-internet-gateway"

routing-policy-name = "terraform-routing-policy"


public-key-location = "./modules/webserver/aws_ssh.pub"
key-name = "aws-password"