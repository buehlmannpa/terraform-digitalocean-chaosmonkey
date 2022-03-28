//resource "digitalocean_kubernetes_node_pool" "k8s_autoscale_nodepool_c1" {
//  cluster_id = digitalocean_kubernetes_cluster.k8s_cluster_c1.id
//
//  name       = var.autoscale_nodepoolname
//  size       = "s-1vcpu-2gb"
//  auto_scale = true
//  min_nodes  = 1
//  max_nodes  = 5
//  node_count = 1
//  tags       = ["kubernetes", "nodes"]
//
//  labels = {
//    env     = "prod"
//    service = "kubernetes"
//    made-by = "terraform"
//  }
//}