resource "aws_key_pair" "public-key" {
  key_name = "${var.mod-var-aws-key-name}"
  public_key = file(var.mod-var-public_key_location) 
}