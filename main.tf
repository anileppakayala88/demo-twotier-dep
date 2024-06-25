module "key_pair" {
  source = "./aws-keypair"
}

module "instance" {
  source        = "./aws-instance"
  REGION        = var.REGION
  instance_Type = var.instance_Type
  aws_key_pair  = module.key_pair.aws_key_pair
}
# resource "aws_instance" "EC2_Instance_Public" {
#   ami           = var.ami_instance
#   instance_type = var.instance_Type
#   #   subnet_id = aws_subnet.public_vpcendpoint_subnet_1a[1].id
#   associate_public_ip_address = var.associate_public_ip_address
#   key_name                    = aws_key_pair.generated_key.key_name
#   tags = {
#     Name = var.public_EC2_instance_name
#   }
#   depends_on = [ aws_key_pair.generated_key ]
# }