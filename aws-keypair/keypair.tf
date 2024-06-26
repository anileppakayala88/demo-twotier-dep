resource "tls_private_key" "terraform_key_generate" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name = "aws_key_pair"

  public_key = tls_private_key.terraform_key_generate.public_key_openssh

  provisioner "local-exec" {
    command = <<-EOT
        echo '${tls_private_key.terraform_key_generate.private_key_pem}' > aws_key_pair.pem
        chmod 400 aws_key_pair.pem
    EOT
  }
}