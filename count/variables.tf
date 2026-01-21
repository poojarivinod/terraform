variable "instances" {
  default = ["mysql", "backend", "frontend"]
}

variable "zone_id" {
  default = "Z04443831PBYSQDB047FF"
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