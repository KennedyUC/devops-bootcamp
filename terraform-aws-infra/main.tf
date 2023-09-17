resource "aws_security_group" "security_group" {
  name_prefix = var.project_name

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_instance" {
  ami             = var.ec2_ami_id
  instance_type   = var.ec2_instance_type
  key_name        = var.aws_key_pair_name
  security_groups = [aws_security_group.security_group.name]

  tags = {
    Name        = var.project_name
    Environment = var.env
  }
}