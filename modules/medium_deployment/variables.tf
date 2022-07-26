
variable "items" {
  type = list(object({
    name     = string
    ip       = string
    hostname = string
    roles = list(string)
    services = list(string)
  }))
  default = [
    {
      name = "Ise PAN Server 1"
      ip = "10.0.0.0"
      hostname = "pan-server-1"
      roles=[]
      services=[]
    },
    {
      name = "Ise PAN Server 2"
      ip = "10.0.0.1"
      hostname = "pan-server-2"
      roles=["SecondaryAdmin","SecondaryMonitoring"]
      services=[]
    },
    {
      name = "Ise PSN Server 3"
      ip = "10.0.0.3"
      hostname = "psn-server-1"
      roles=[]
      services=["Session","Profiler"]
    },
    {
      name = "Ise PSN Server 4"
      ip = "10.0.0.4"
      hostname = "psn-server-2"
      roles=[]
      services=["Session","Profiler"]
    },
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