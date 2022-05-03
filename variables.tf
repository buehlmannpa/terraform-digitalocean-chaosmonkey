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
  description = "Name of the chaos-monkey host"
}

variable "droplet_image" {
  type        = string
  default     = "ubuntu-20-04-x64"
  description = "Droplet image of the chaos-monkey host"
}

variable "droplet_size" {
  type        = string
  default     = "s-1vcpu-1gb"
  description = "Droptlet size of the chaos-monkey host"
}

variable "volumename" {
  type        = string
  default     = "vlscmn-fra1-vol1"
  description = "Volume name of the chaos-monkey host volume"
}

variable "volume_size" {
  type        = number
  default     = 5
  description = "Volume size of the chaos-monkey host volume"
}

variable "volume_filesystem_type" {
  type        = string
  default     = "ext4"
  description = "Filesystem type of the chaos-monkey host volume"
}
