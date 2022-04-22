# Deployment for Sock-Shop
data "kubectl_file_documents" "sockshop" {
  content = file("terraform_kubernetes/manifest/sock-shop.yaml")
}

resource "kubectl_manifest" "sockshop" {
  for_each  = data.kubectl_file_documents.sockshop.manifests
  yaml_body = each.value
}

# Deployment for Online-Boutique
data "kubectl_file_documents" "onlineboutique" {
  content = file("terraform_kubernetes/manifest/online-boutique.yaml")
}

resource "kubectl_manifest" "onlineboutique" {
  for_each  = data.kubectl_file_documents.onlineboutique.manifests
  yaml_body = each.value
}

# Deployment for Yelb
data "kubectl_file_documents" "yelb" {
  content = file("terraform_kubernetes/manifest/yelb.yaml")
}

resource "kubectl_manifest" "yelb" {
  for_each  = data.kubectl_file_documents.yelb.manifests
  yaml_body = each.value
}
