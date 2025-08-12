resource "aws_instance" "web" {         #terraform aws ec2
  ami                    = local.ami_id # this is our devops-practice AMI id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  # instance_type          = "t3.micro"
  instance_type = local.instance_type
  tags = {
    Name    = local.name
    purpose = "terraform-practice"
  }
}


resource "aws_security_group" "allow_tls" { #terraform aws security group
  name        = "allow_tls"
  # name        = "allow_tls_changed"
  description = "Allow TLS inbound traffic and all outbound traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_tls"
  }
}
