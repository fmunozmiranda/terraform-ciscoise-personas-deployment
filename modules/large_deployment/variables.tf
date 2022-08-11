
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
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "ise_base_hostname" {
  type = string
}

variable "ise_domain" {
  type = string
}