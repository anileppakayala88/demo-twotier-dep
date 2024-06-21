resource "aws_instance" "EC2_Instance_Public" {
  ami           = var.ami_instance
  instance_type = var.instance_Type
#   subnet_id = aws_subnet.public_vpcendpoint_subnet_1a[1].id
  associate_public_ip_address = var.associate_public_ip_address
  tags = {
    Name = var.public_EC2_instance_name
  }

}