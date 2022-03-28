provider "digitalocean" {
  token = var.do_token
}

provider "kubernetes" {
  host  = digitalocean_kubernetes_cluster.k8s_cluster_c1.endpoint
  token = digitalocean_kubernetes_cluster.k8s_cluster_c1.kube_config[0].token
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.k8s_cluster_c1.kube_config[0].cluster_ca_certificate
  )
}

provider "kubectl" {
  host  = digitalocean_kubernetes_cluster.k8s_cluster_c1.endpoint
  token = digitalocean_kubernetes_cluster.k8s_cluster_c1.kube_config[0].token
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.k8s_cluster_c1.kube_config[0].cluster_ca_certificate
  )
  load_config_file = false
}

