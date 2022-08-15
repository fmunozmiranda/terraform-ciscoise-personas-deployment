variable "ise_username" {
  type = string
}

variable "ise_password" {
  type = string
}

variable "ise_deployment" {
  type = string
  validation {
    condition     =  var.ise_deployment == "small_deployment" || var.ise_deployment == "medium_deployment" || var.ise_deployment == "large_deployment"
    error_message = "The ise_deployment value must be a some of values : (single_node, small_deployment, medium_deployment, large_deployment)."
  }
  description = "ISE Type Deployment, it should be one of: (small_deployment, medium_deployment, large_deployment)."
}

variable "ise_base_hostname" {
  type = string
}

variable "ise_domain" {
  type = string
}

variable "pan1_ip" {
  type = string
}
variable "pan2_ip" {
  type = string
}

variable "psn1_ip" {
  type = string
}
variable "psn2_ip" {
  type = string
}

variable "mnt1_ip" {
  type = string
}

variable "mnt2_ip" {
  type = string
}