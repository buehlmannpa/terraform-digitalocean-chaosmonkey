#----------------
# Environment Vars
#----------------
variable "do_token" {
  type        = string
  sensitive   = true
  description = "API Token to access digitalocean cloud"
  default     = "d332320576bd308e4ce59e3cd35c4a600bd2abdd94689385cbdec5d419436479"
}

variable "pvt_key" {
  type        = string
  default     = "/Users/pbu/.ssh/id_rsa"
  description = "Default location of ssh key on private macbook"
}
variable "pub_key" {
  type        = string
  default     = "/Users/pbu/.ssh/id_rsa.pub"
  description = "Default location of ssh key on private macbook"
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
