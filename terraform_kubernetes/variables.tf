#----------------
# Environment Vars
#----------------
variable "do_token" {
  type        = string
  sensitive   = true
  description = "API Token to access digitalocean cloud"
  default     = "d332320576bd308e4ce59e3cd35c4a600bd2abdd94689385cbdec5d419436479"
}

variable "region" {
  type        = string
  default     = "fra1"
  description = "VPC regiion where the componentes where deployed"
}

variable "clustername" {
  type        = string
  default     = "k8s-cluter-c1-fra1-1227"
  description = "Name of the kubernetes cluster"
}

variable "nodepoolname" {
  type        = string
  default     = "k8s-nodepool-c1-fra1"
  description = "Name of the kubernetes node pool"
}

variable "autoscale_nodepoolname" {
  type        = string
  default     = "k8s-autoscale-nodepool-c1-fra1"
  description = "Name of the kubernetes node pool"
}