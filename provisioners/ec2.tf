resource "aws_instance" "web" {                    #terraform aws ec2
  ami                    = "ami-09c813fb71547fc4f" # this is our devops-practice AMI id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = "t3.micro"
  tags = {
    Name    = "terraform-demo"
    purpose = "terraform-practice"
  }
  provisioner "local-exec" { # provisioners in terraform
    command = "echo ${self.private_ip} > inventory" # store private ip in inventory file.
  }
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }
  provisioner "remote-exec" { # provisioners in terraform -->search as remote-exec
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
    ]
  }
  provisioner "remote-exec" {  # provisioners in terraform --> Declaring Provisioners
    when = destroy 
    inline = [
      "sudo systemctl start nginx"
    ]
  }


}



resource "aws_security_group" "allow_tls" { #terraform aws security group
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
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
  tags = {
    Name = "allow_tls"
  }
}
