variable "clustername_cluster1" {
  type        = string
  default     = "k8s-cluter-c1-fra1-1227"
  description = "Name of the kubernetes cluster"
}

variable "clustername_cluster2" {
  type        = string
  default     = "k8s-cluter-c2-fra1-1227"
  description = "Name of the kubernetes cluster"
}

variable "do_token" {
  type        = string
  sensitive   = true
  description = "API Token to access digitalocean cloud"
  default     = "d332320576bd308e4ce59e3cd35c4a600bd2abdd94689385cbdec5d419436479"
}
