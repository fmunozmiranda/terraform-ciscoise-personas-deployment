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



module "small" {
  source = "./modules/small_deployment"
  count = var.ise_deployment == "small_deployment" ? 1 : 0
  
  username = var.ise_username
  password = var.ise_password
  ise_base_hostname= var.ise_base_hostname
  ise_domain= var.ise_domain
  pan1_ip=var.pan1_ip 
  pan2_ip=var.pan2_ip 
}
module "medium" {
  source = "./modules/medium_deployment"
  count = var.ise_deployment == "medium_deployment" ? 1 : 0
  
  username = var.ise_username
  password = var.ise_password
  ise_base_hostname= var.ise_base_hostname
  ise_domain= var.ise_domain
  pan1_ip=var.pan1_ip 
  pan2_ip=var.pan2_ip 
  psn1_ip=var.psn1_ip
  psn2_ip=var.psn2_ip
}
module "large" {
  source = "./modules/large_deployment"
  count = var.ise_deployment == "large_deployment" ? 1 : 0
  username = var.ise_username
  password = var.ise_password
  ise_base_hostname= var.ise_base_hostname
  ise_domain= var.ise_domain
  pan1_ip=var.pan1_ip 
  pan2_ip=var.pan2_ip 
  psn1_ip=var.psn1_ip
  psn2_ip=var.psn2_ip
  mnt1_ip=var.mnt1_ip
  mnt2_ip=var.mnt2_ip
}