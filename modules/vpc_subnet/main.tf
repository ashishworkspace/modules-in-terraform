
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


# Creating Internet Gateway
resource "aws_internet_gateway" "mod-var-ig" {
  vpc_id = aws_vpc.mod-var-vpc.id
  tags = {
    "Name" = "${var.mod-var-internet-gw}"
  }
}

# Creating Routing policy
resource "aws_route_table" "mod-var-route-table" {
  tags = {
    "Name" = "${var.mod-var-routing-name}"
  }
  vpc_id = aws_vpc.mod-var-vpc.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.mod-var-ig.id
  }
}

# Adding the routing policy to subnet
resource "aws_route_table_association" "mod-var-route-attachment" {
  subnet_id = aws_subnet.mod-var-subnet.id
  route_table_id = aws_route_table.mod-var-route-table.id
}