locals {
  ami_id        = data.aws_ami.joindevops.id
  instance_type = "t3.micro"
  name          = "${var.project}-${var.environment}-${var.Component}"
  # name        = "${var.project}-${var.environment}-${var.Component}-changed"
}

  