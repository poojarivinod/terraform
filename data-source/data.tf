data "aws_ami" "joindevops" { #data source aws ami terraform
    most_recent      = true
    owners           = ["973714476881"] #Owner account ID ( it never changes and fixed)

filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

data "aws_vpc" "default" { #data source aws vpc terraform
   default = true
}

output "ami_id" {
    value = data.aws_ami.joindevops
} 

output "default_vpc_id" {
    value = data.aws_vpc.default.id
}
