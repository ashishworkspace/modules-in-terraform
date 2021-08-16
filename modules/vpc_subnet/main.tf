
# Creating VPC
resource "aws_vpc" "mod-var-vpc" {
  tags = {
      "Name" = "${var.mod-var-vpc-name}"
  }
  cidr_block = "${var.mod-var-cidr-block-vpc}"
  enable_dns_hostnames = true
  enable_dns_support = true
}