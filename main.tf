# Require TF version to be same as or greater than 0.12.13 #
terraform {
  required_version = ">=0.12.13"
 # backend "s3" {
 #   bucket         = "kyler-github-actions-demo-terraform-tfstate"
 #   key            = "terraform.tfstate"
 #   region         = "us-east-1"
 #   dynamodb_table = "aws-locks"
 #   encrypt        = true
 # }
}

# Download any stable version in AWS provider of 2.36.0 or higher in 2.36 train
provider "aws" {
  region  = "us-east-1"
  version = "~> 2.36.0"
}





# use ubuntu 20 AMI for EC2 instance
data "aws_ami" "ubuntu" {
    most_recent = true
filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/*20.04-amd64-server-*"]
    }
filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
owners = ["099720109477"] # Canonical
}
# provision to us-east-2 region
#provider "aws" {
#  region  = "us-east-2"
#}
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = "app-ssh-key"
tags = {
    Name = "ubuntu-ec2"
  }
}
