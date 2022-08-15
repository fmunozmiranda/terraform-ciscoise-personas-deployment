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

locals {
  items = [
    {
      name = "Ise PAN Server 1"
      ip = var.pan1_ip
      hostname = "${lower(var.ise_base_hostname)}-pan-server-1"
      fqdn = "${lower(var.ise_base_hostname)}-pan-server-1.${var.ise_domain}"
      roles=[]
      services=[]
    },
    {
      name = "Ise PAN Server 2"
      ip = var.pan2_ip
      hostname = "${lower(var.ise_base_hostname)}-pan-server-2"
      fqdn = "${lower(var.ise_base_hostname)}-pan-server-2.${var.ise_domain}"
      roles=["SecondaryAdmin"]
      services=[]
    },
    {
      name = "Ise mnt Server 3"
      ip = var.mnt1_ip
      hostname = "${lower(var.ise_base_hostname)}-mnt-server-1"
      fqdn = "${lower(var.ise_base_hostname)}-mnt-server-1.${var.ise_domain}"
      roles=[]
      services=["PrimaryMonitoring"]
    },
    {
      name = "Ise mnt Server 4"
      ip = var.mnt2_ip
      hostname = "${lower(var.ise_base_hostname)}-mnt-server-2"
      fqdn = "${lower(var.ise_base_hostname)}-mnt-server-2.${var.ise_domain}"
      roles=["SecondaryMonitoring"]
      services=["Session","Profiler"]
    },
    {
      name = "Ise PSN Server 5"
      ip = var.psn1_ip
      hostname = "${lower(var.ise_base_hostname)}-psn-server-1"
      fqdn = "${lower(var.ise_base_hostname)}-psn-server-1.${var.ise_domain}"
      roles=[]
      services=["Session","Profiler"]
    },
    {
      name = "Ise PSN Server 6"
      ip = var.psn2_ip
      hostname = "${lower(var.ise_base_hostname)}-psn-server-2"
      fqdn = "${lower(var.ise_base_hostname)}-psn-server-2.${var.ise_domain}"
      roles=[]
      services=["Session","Profiler"]
    },
]

itemsToRegister= [
    {
      name = "Ise PAN Server 1"
      ip = var.pan1_ip
      hostname = "${lower(var.ise_base_hostname)}-pan-server-1"
      fqdn = "${lower(var.ise_base_hostname)}-pan-server-1.${var.ise_domain}"
      roles=[]
      services=[]
    },
    {
      name = "Ise PAN Server 2"
      ip = var.pan2_ip
      hostname = "${lower(var.ise_base_hostname)}-pan-server-2"
      fqdn = "${lower(var.ise_base_hostname)}-pan-server-2.${var.ise_domain}"
      roles=["SecondaryAdmin"]
      services=[]
    },
    {
      name = "Ise mnt Server 3"
      ip = var.mnt1_ip
      hostname = "${lower(var.ise_base_hostname)}-mnt-server-1"
      fqdn = "${lower(var.ise_base_hostname)}-mnt-server-1.${var.ise_domain}"
      roles=["PrimaryMonitoring"]
      services=[]
    },
    {
      name = "Ise PSN Server 5"
      ip = var.psn1_ip
      hostname = "${lower(var.ise_base_hostname)}-psn-server-1"
      fqdn = "${lower(var.ise_base_hostname)}-psn-server-1.${var.ise_domain}"
      roles=[]
      services=["Session","Profiler"]
    },
    {
      name = "Ise PSN Server 6"
      ip = var.psn2_ip
      hostname = "${lower(var.ise_base_hostname)}-psn-server-2"
      fqdn = "${lower(var.ise_base_hostname)}-psn-server-2.${var.ise_domain}"
      roles=[]
      services=["Session","Profiler"]
    },
]
}

resource "ciscoise_personas_check_standalone" "check_standalone" {
  count = length(local.items)
  parameters{
    ip= local.items[count.index].ip
    username= var.username
    password= var.password
    hostname= "${lower(var.ise_base_hostname)}-${local.items[count.index].hostname}"
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
  count = length(local.itemsToRegister)-1
  parameters{
    primary_ip= local.itemsToRegister[0].ip
    primary_username= var.username 
    primary_password= var.password 
    fqdn= local.items[count.index].fqdn
    username= var.username 
    password= var.password 
    roles= local.itemsToRegister[count.index+1].roles
    services= local.itemsToRegister[count.index+1].services
  }
}

resource "ciscoise_personas_update_roles_services" "update_roles_services" {
  depends_on = [ciscoise_personas_register_node.register_node]
  parameters{
    ip= local.items[0].ip
    username= var.username
    password= var.password
    hostname= "${lower(var.ise_base_hostname)}-${local.items[0].hostname}"
    roles=["PrimaryAdmin"]
    services=[]
  }
}

resource "time_sleep" "wait_10_minutes" {
  depends_on = [ciscoise_personas_update_roles_services.update_roles_services]

  create_duration = "10m"
}

resource "ciscoise_personas_register_node" "register_node_2" {
   depends_on = [time_sleep.wait_10_minutes]
  parameters{
    primary_ip= local.items[0].ip
    primary_username= var.username 
    primary_password= var.password 
    fqdn= local.items[3].fqdn
    username= var.username 
    password= var.password 
    roles= ["SecondaryMonitoring"]
    services= []
  }
}