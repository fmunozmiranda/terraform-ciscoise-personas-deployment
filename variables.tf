variable "ise_username" {
  type = string
}

variable "ise_password" {
  type = string
}

variable "ise_deployment" {
  type = string
}

variable "ise_base_hostname" {
  type = string
}

variable "ise_domain" {
  type = string
}

variable "items" {
  type = list(object({
    name     = string
    ip       = string
    hostname = string
    roles = list(string)
    services = list(string)
  }))
}

variable "items_to_register" {
  type = list(object({
    name     = string
    ip       = string
    hostname = string
    roles = list(string)
    services = list(string)
  }))
  default = [ {
    hostname = "value"
    ip = "value"
    name = "value"
    roles = [ "value" ]
    services = [ "value" ]
  } ]
}