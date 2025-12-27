resource "aws_instance" "import" {
    instance_type = "t2.micro"
    ami = "ami-09c813fb71547fc4f"
   tags = {
        Name = "terraform demo changed"
    }
    tags_all = {
        Name = "terraform demo changed"
    } 
}