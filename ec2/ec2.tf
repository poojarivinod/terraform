resource "aws_instance" "web" {                    #terraform aws ec2
  # count = 2
  ami                    = "ami-0220d79f3f480ecf5" # this is our devops-practice AMI id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = "t3.micro"
  tags = {
    Name    = "terraform-demo"
    purpose = "terraform-practice"
  }
}

resource "aws_security_group" "allow_tls" { #terraform aws security group
  name        = "allow_tls"
  description = "Allow SSH inbound traffic and all outbound traffic"
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
