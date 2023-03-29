##Create and bootstrap webserver #lanzar
resource "aws_instance" "webserver" {
  ami                         = data.aws_ssm_parameter.webserver-ami.value
  instance_type               = "t3.micro"
  #key_name                    = app-ssh-key 
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  user_data                   = "${file("create_apache.sh")}"

  tags = {
    Name = "webserver"
  }
}
