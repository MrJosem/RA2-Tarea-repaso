resource "aws_instance" "debian" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  availability_zone = "${var.aws_region}a"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_http_and_ssh.id]
  key_name = aws_key_pair.debian_pub.key_name
  user_data              = file("user_data.sh")

  tags = {
    Name = "ec2-debian"
  }
}