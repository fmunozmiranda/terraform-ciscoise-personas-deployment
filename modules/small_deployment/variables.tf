variable "roles" {
  type = list(string)
  default = ["SecondaryAdmin","SecondaryMonitoring"]
}

variable "services" {
  type = list(string)
  default = ["Session","Profiler"]
}
# variable "items" {
#   type = list(object({
#     name     = string
#     ip       = string
#     hostname = string
#   }))
# }

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

variable "pan1_ip" {
  type = string
}
variable "pan2_ip" {
  type = string
}