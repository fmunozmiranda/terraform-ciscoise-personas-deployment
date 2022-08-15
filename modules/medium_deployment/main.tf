terraform {
  required_providers {
    ciscoise = {
      source = "CiscoISE/ciscoise"
      version = "0.6.5-beta"
    }
    time = {
      source = "hashicorp/time"
      version = "0.7.2"
    }
  }
}

locals{
  items = [
    {
      name = "Ise PAN Server 1"
      ip = var.pan1_ip
      hostname = "${lower(var.ise_base_hostname)}-pan-server-1"
      roles=["PrimaryAdmin","PrimaryMonitoring"]
      services=[]
    },
    {
      name = "Ise PAN Server 2"
      ip = var.pan2_ip
      hostname = "${lower(var.ise_base_hostname)}-pan-server-2"
      roles=["SecondaryAdmin","SecondaryMonitoring"]
      services=[]
    },
    {
      name = "Ise PSN Server 3"
      ip = var.psn1_ip
      hostname = "${lower(var.ise_base_hostname)}-psn-server-1"
      roles=[]
      services=["Session","Profiler"]
    },
    {
      name = "Ise PSN Server 4"
      ip = var.psn2_ip
      hostname = "${lower(var.ise_base_hostname)}-psn-server-2"
      roles=[]
      services=["Session","Profiler"]
    },
]
}
resource "ciscoise_personas_check_standalone" "check_standalone" {
  count = length(local.items)-1
  parameters{
    ip= local.items[count.index+1].ip
    username= var.username
    password= var.password
    hostname= "${lower(var.ise_base_hostname)}-${local.items[count.index+1].hostname}"
  }
}

resource "ciscoise_personas_export_certs" "export_certs" {
  depends_on = [ciscoise_personas_check_standalone.check_standalone]
  count = length(local.items)-1
  parameters{
    primary_ip= local.items[0].ip
    primary_username= var.username 
    primary_password= var.password 
    name= local.items[count.index+1].name
    ip= local.items[count.index+1].ip
    hostname= "${lower(var.ise_base_hostname)}-${local.items[count.index+1].hostname}"
    username= var.username 
    password= var.password 
  }
}

resource "ciscoise_personas_promote_primary" "promote_primary" {
  depends_on = [ciscoise_personas_export_certs.export_certs]
  parameters{
    ip= local.items[0].ip
    username= var.username
    password= var.password
  }
}

resource "time_sleep" "wait_1_minute" {
  depends_on = [ciscoise_personas_promote_primary.promote_primary]

  create_duration = "1m"
}

resource "ciscoise_personas_register_node" "register_node" {
  depends_on = [time_sleep.wait_1_minute]
  count = length(local.items)-1
  parameters{
    primary_ip= local.items[0].ip
    primary_username= var.username 
    primary_password= var.password 
    fqdn= "${lower(var.ise_base_hostname)}-${local.items[count.index+1].hostname}.${var.ise_domain}"
    username= var.username 
    password= var.password 
    roles= local.items[count.index+1].roles
    services= local.items[count.index+1].services
  }
}

resource "ciscoise_personas_update_roles_services" "update_roles_services" {
  depends_on = [ciscoise_personas_register_node.register_node]
  parameters{
    ip= local.items[0].ip
    username= var.username
    password= var.password
    hostname= "${lower(var.ise_base_hostname)}-${local.items[0].hostname}"
    roles=["PrimaryAdmin","PrimaryMonitoring"]
    services=[]
  }
}