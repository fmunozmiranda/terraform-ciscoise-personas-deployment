
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
      name = "Ise mnt Server 3"
      ip = "10.0.0.3"
      hostname = "mnt-server-1"
      roles=[]
      services=["Session","Profiler"]
    },
    {
      name = "Ise mnt Server 4"
      ip = "10.0.0.4"
      hostname = "mnt-server-2"
      roles=[]
      services=["Session","Profiler"]
    },
    {
      name = "Ise PSN Server 5"
      ip = "10.0.0.5"
      hostname = "psn-server-1"
      roles=[]
      services=["Session","Profiler"]
    },
    {
      name = "Ise PSN Server 6"
      ip = "10.0.0.6"
      hostname = "psn-server-2"
      roles=[]
      services=["Session","Profiler"]
    },
  ]
}

variable "items_to_register" {
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
      roles=["SecondaryAdmin"]
      services=[]
    },
    {
      name = "Ise mnt Server 3"
      ip = "10.0.0.3"
      hostname = "mnt-server-1"
      roles=["PrimaryMonitoring"]
      services=[]
    },
    {
      name = "Ise PSN Server 5"
      ip = "10.0.0.5"
      hostname = "psn-server-1"
      roles=[]
      services=["Session","Profiler"]
    },
    {
      name = "Ise PSN Server 6"
      ip = "10.0.0.6"
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