variable "do_token" {
  type        = string
  sensitive   = true
  description = "API Token to access digitalocean cloud - exported to the env vars of host"
}

variable "pvt_key" {
  type        = string
  default     = "/home/buehlmannpa/.ssh/id_rsa"
  description = "Default location of ssh key on private macbook"
  #default     = "/Users/pbu/.ssh/id_rsa"
}

variable "pub_key" {
  type        = string
  default     = "/home/buehlmannpa/.ssh/id_rsa.pub"
  description = "Default location of ssh key on private macbook"
  //default     = "/Users/pbu/.ssh/id_rsa.pub"
}

variable "region" {
  type        = string
  default     = "fra1"
  description = "VPC regiion where the componentes where deployed"
}

variable "hostname" {
  type        = string
  default     = "vlscmn-fra1"
  description = "Name of the kubernetes cluster"
}
