terraform {
  required_providers {
    aws={
      source= "hashicorp/aws"
      version = "~> 5.40"  # Use latest stable 5.x version
    }
  }
  required_version = ">= 1.3.0"
}
provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "test_ec2_terraform" {
          count = 1
          ami = "ami" #imageid
  instance_type = "t2.micro"
  tags = {
    Name= "tf_ec2"
  }

}
output "ec2_public_ip" {
  value = aws_instance.test_ec2_terraform[0].public_ip
  description = "The public IP of the EC2 instance"
}
