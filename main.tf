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

module "small" {
  source = "./modules/small_deployment"
  count = var.ise_deployment == "small_deployment" ? 1 : 0
  
  username = var.ise_username
  password = var.ise_password
  ise_base_hostname= var.ise_base_hostname
  ise_domain= var.ise_domain
}
module "medium" {
  source = "./modules/medium_deployment"
  count = var.ise_deployment == "medium_deployment" ? 1 : 0
  
  username = var.ise_username
  password = var.ise_password
  ise_base_hostname= var.ise_base_hostname
  ise_domain= var.ise_domain
}
module "large" {
  source = "./modules/large_deployment"
  count = var.ise_deployment == "large_deployment" ? 1 : 0
  username = var.ise_username
  password = var.ise_password
  ise_base_hostname= var.ise_base_hostname
  ise_domain= var.ise_domain
}