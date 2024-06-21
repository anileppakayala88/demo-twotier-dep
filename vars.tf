variable "REGION" {
  default = "us-east-1"
}

variable "ami_instance" {
  default = "ami-0c7217cdde317cfec"
}

variable "instance_Type" {
  default = "t2.micro"
}

variable "associate_public_ip_address" {
  default = "true"  
}

variable "public_EC2_instance_name"{
  default = "Public EC2 Instance"
}