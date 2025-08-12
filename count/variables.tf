variable "instances" {
  default = ["mysql", "backend", "frontend"]
}

variable "zone_id" {
  default = "Z0802349255PD9KZJ7SQF"
}

variable "domain_name" {
  default = "poojari.store"
}

variable "common_tags" {
  type = map(any)
  default = {
    project     = "expense"
    environment = "dev"
  }
}