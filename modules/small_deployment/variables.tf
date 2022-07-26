variable "roles" {
  type = list(string)
  default = ["SecondaryAdmin","SecondaryMonitoring"]
}

variable "services" {
  type = list(string)
  default = ["Session","Profiler"]
}
variable "items" {
  type = list(object({
    name     = string
    ip       = string
    hostname = string
  }))
  default = [
    {
      name = "Ise Server 1"
      ip = "10.0.0.0"
      hostname = "hostname"
    },
    {
      name = "Ise Server 2"
      ip = "10.0.0.1"
      hostname = "hostname2"
    }
  ]
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