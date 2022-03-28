// Create Kubernetes Cluster
module "k8s_cluster" {
  source = "./terraform_kubernetes"
}

// Create Kubernetes Cluster
module "chaosmonkey_host" {
  source = "./terraform_linuxhost"
}