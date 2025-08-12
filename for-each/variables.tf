variable "instances" {
    type = map
    default = {
        mysql = "t3.small"
        backend = "t3.micro"
        frontend = "t3.micro"
    }
}

variable "zone_id" {
  default = "Z0802349255PD9KZJ7SQF"
}

variable "domain_name" {
  default = "poojari.store"
}