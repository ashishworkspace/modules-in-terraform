
# Creating VPC
resource "aws_vpc" "mod-var-vpc" {
  tags = {
      "Name" = "${var.mod-var-vpc-name}"
  }
  cidr_block = "${var.mod-var-cidr-block-vpc}"
  enable_dns_hostnames = true
  enable_dns_support = true
}


# Creating Subnet

resource "aws_subnet" "mod-var-subnet" {
    tags = {
      "Name" = "${var.mod-var-subnet-name}"
    }
    availability_zone = "${var.mod-var-az}"
    cidr_block = "${var.mod-var-subnet-cidr-range}"
    vpc_id = aws_vpc.mod-var-vpc.id  
}