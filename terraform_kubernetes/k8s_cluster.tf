data "digitalocean_kubernetes_versions" "prefix" {
  version_prefix = "1.22."
}

resource "digitalocean_kubernetes_cluster" "k8s_cluster_c1" {
  name    = var.clustername
  region  = var.region
  version = data.digitalocean_kubernetes_versions.prefix.latest_version

  node_pool {
    name       = var.autoscale_nodepoolname
    size       = "s-2vcpu-2gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 10
    node_count = 3

    tags = ["kubernetes", "nodes"]

    labels = {
      env     = "prod"
      service = "kubernetes"
      made-by = "terraform"
    }
  }
}
