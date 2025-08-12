resource "aws_instance" "web" {                    #terraform aws ec2
  ami                    = "ami-09c813fb71547fc4f" # this is our devops-practice AMI id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = "t3.micro"
  tags = {
    Name    = "terraform-demo"
    purpose = "terraform-practice"
  }
}


resource "aws_security_group" "allow_tls" { #terraform aws security group
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  
  dynamic "ingress"{ # terraform will give you a keyword with block name, here "ingress" is the block name, you can iterate using ingress. # in ansible, for loop we have keyword "item". # terraform dynamic block ----> cloudBoult
    for_each = var.ingress_ports
    content{
    from_port   = ingress.value["from_port"]
    to_port     = ingress.value["to_port"]
    protocol    = ingress.value["protocol"]
    cidr_blocks = ingress.value["cidr_blocks"]
    }  
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
