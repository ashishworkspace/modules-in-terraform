resource "aws_key_pair" "public-key" {
  key_name = "${var.mod-var-aws-key-name}"
  public_key = file(var.mod-var-public_key_location) 
}

# Creating AWS Security Group
resource "aws_security_group" "security-group" {
  tags = {
    "Name" = "terraform-sg"
  }
  vpc_id = var.mod-var-vpc-id
  ingress   {
  cidr_blocks = [ var.mod-var-ipv4-local-ingress ]
  description = "This is the local IP for configuring SG"
  from_port = 22
  to_port = 22
  protocol = "tcp"
} 
  ingress  {
  cidr_blocks = [ "0.0.0.0/0" ]
  from_port = 8080
  to_port = 8080
  protocol = "tcp"
} 
 egress  {
   cidr_blocks = [ "0.0.0.0/0" ]
   description = "Every IP will be send outside"
   from_port = 0 
   prefix_list_ids = [  ]
   protocol = "-1"
   to_port = 0
 } 
}

# Launching an instance
resource "aws_instance" "instance-in-aws" {
  ami = var.mod-var-ami
  availability_zone = var.mod-var-az
  associate_public_ip_address = true
  count = var.mod-var-no-of-instance
  instance_type = "t2.micro"
  subnet_id = var.mod-var-subnet-id
  vpc_security_group_ids = [aws_security_group.security-group.id]
  key_name = "${var.mod-var-aws-key-name}"
}