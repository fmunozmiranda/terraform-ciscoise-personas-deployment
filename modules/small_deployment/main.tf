
terraform {
  required_providers {
    ciscoise = {
      version = "0.6.3-beta"
      source  = "hashicorp.com/edu/ciscoise"
    }
    time = {
      source = "hashicorp/time"
      version = "0.7.2"
    }
  }
}

resource "ciscoise_personas_check_standalone" "check_standalone" {
  count = length(var.items)
  parameters{
    ip= var.items[count.index].ip
    username= var.username
    password= var.password
    hostname= var.items[count.index].hostname
  }
}

resource "ciscoise_personas_export_certs" "export_certs" {
  depends_on = [ciscoise_personas_check_standalone.check_standalone]
  parameters{
    primary_ip= var.items[0].ip
    primary_username= var.username 
    primary_password= var.password 
    name= var.items[1].name
    ip= var.items[1].ip
    hostname= var.items[1].hostname
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

resource "ciscoise_personas_register_node" "register_node" {
  depends_on = [ciscoise_personas_promote_primary.promote_primary]
  parameters{
    primary_ip= var.items[0].ip
    primary_username= var.username 
    primary_password= var.password 
    fqdn= "${lower(var.ise_base_hostname)}-server-2.${var.ise_domain}"
    username= var.username 
    password= var.password 
    roles= var.roles
    services= var.services
  }
}