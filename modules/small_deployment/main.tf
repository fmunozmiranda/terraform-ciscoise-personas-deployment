
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
  items =[ 
    {
        name = "ISE-S-server-psn-1"
        ip = var.pan1_ip
        hostname = "${lower(var.ise_base_hostname)}-server-1"
        roles=[]
        services=[]
    },
    {
        name = "ISE-S-server-psn-2"
        ip = var.pan2_ip
        hostname = "${lower(var.ise_base_hostname)}-server-2"
        roles=["SecondaryAdmin","SecondaryMonitoring"]
        services=["Session","Profiler"]
    }
]
}
resource "ciscoise_personas_check_standalone" "check_standalone" {
  count = length(local.items)
  parameters{
    ip= local.items[count.index].ip
    username= var.username
    password= var.password
    hostname= local.items[count.index].hostname
  }
}

resource "ciscoise_personas_export_certs" "export_certs" {
  depends_on = [ciscoise_personas_check_standalone.check_standalone]
  parameters{
    primary_ip= local.items[0].ip
    primary_username= var.username 
    primary_password= var.password 
    name= local.items[1].name
    ip= local.items[1].ip
    hostname= local.items[1].hostname
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
  parameters{
    primary_ip= local.items[0].ip
    primary_username= var.username 
    primary_password= var.password 
    fqdn= "${lower(var.ise_base_hostname)}-server-2.${var.ise_domain}"
    username= var.username 
    password= var.password 
    roles= var.roles
    services= var.services
  }
}
