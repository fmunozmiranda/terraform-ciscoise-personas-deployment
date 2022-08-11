terraform {
  required_providers {
    ciscoise = {
      version = "0.6.4-beta"
      source  = "hashicorp.com/edu/ciscoise"
    }
    time = {
      source = "hashicorp/time"
      version = "0.7.2"
    }
  }
}

resource "ciscoise_personas_check_standalone" "check_standalone" {
  count = length(var.items)-1
  parameters{
    ip= var.items[count.index+1].ip
    username= var.username
    password= var.password
    hostname= "${lower(var.ise_base_hostname)}-${var.items[count.index+1].hostname}"
  }
}

resource "ciscoise_personas_export_certs" "export_certs" {
  depends_on = [ciscoise_personas_check_standalone.check_standalone]
  count = length(var.items)-1
  parameters{
    primary_ip= var.items[0].ip
    primary_username= var.username 
    primary_password= var.password 
    name= var.items[count.index+1].name
    ip= var.items[count.index+1].ip
    hostname= "${lower(var.ise_base_hostname)}-${var.items[count.index+1].hostname}"
    username= var.username 
    password= var.password 
  }
}

resource "ciscoise_personas_promote_primary" "promote_primary" {
  depends_on = [ciscoise_personas_export_certs.export_certs]
  parameters{
    ip= var.items[0].ip
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
  count = length(var.items)-1
  parameters{
    primary_ip= var.items[0].ip
    primary_username= var.username 
    primary_password= var.password 
    fqdn= "${lower(var.ise_base_hostname)}-${var.items[count.index+1].hostname}.${var.ise_domain}"
    username= var.username 
    password= var.password 
    roles= var.items[count.index+1].roles
    services= var.items[count.index+1].services
  }
}

resource "ciscoise_personas_update_roles_services" "update_roles_services" {
  depends_on = [ciscoise_personas_register_node.register_node]
  parameters{
    ip= var.items[0].ip
    username= var.username
    password= var.password
    hostname= "${lower(var.ise_base_hostname)}-${var.items[0].hostname}"
    roles=["PrimaryAdmin","PrimaryMonitoring"]
    services=[]
  }
}