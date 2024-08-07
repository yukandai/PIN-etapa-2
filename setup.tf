provider "aws" { region = "us-east-1" }

data "aws_vpc" "vpc_default" { default = true }

#data source para obtener la region
data "aws_region" "current" {}

#data source para id de la cuenta de AWS
data "aws_caller_identity" "current" {}

#Create SG for allowing TCP/80 & TCP/22
resource "aws_security_group" "sg" {
  name        = "webserver-sg"
  description = "Allow TCP/80 & TCP/22"
  vpc_id      = data.aws_vpc.vpc_default.id
  ingress {
    description = "Allow SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow traffic from TCP/80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#recurso de amazon
resource "aws_s3_bucket" "example_bucket" {
  bucket = "mi-bucket-de-ejemplo"
  acl = "private"
}

output "Webserver-Public-IP" {
  value = aws_instance.webserver.public_ip
}
