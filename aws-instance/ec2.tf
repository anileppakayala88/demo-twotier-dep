resource "aws_instance" "ec2_instance" {
    ami = lookup(var.ami_instance, var.REGION)
    instance_type = var.instance_Type
    key_name = var.aws_key_pair
    tags = {
      Name = var.public_EC2_instance_name
    }
    depends_on = [ var.aws_key_pair ]
    connection {
        type = "ssh"
        host = self.public_ip
        user = "ec2-user"

        private_key = file("aws_keys_pairs.pem")
        timeout = "4m"
    }  
}