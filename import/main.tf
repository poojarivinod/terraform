resource "aws_instance" "import" {
    instance_type = "t2.micro"
    ami = "ami-0220d79f3f480ecf5"
   tags = {
        Name = "terraform demo changed"
    }
    tags_all = {
        Name = "terraform demo changed"
    } 
}