output "vpc-instance" {
  value = aws_vpc.mod-var-vpc
}

output "subnet-id" {
  value = aws_subnet.mod-var-subnet
}