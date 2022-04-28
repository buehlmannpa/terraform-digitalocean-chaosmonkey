resource "digitalocean_project" "chaosmonkey_dev" {
  name        = "ChaosMonkey-Dev"
  description = "All resources for the thesis about the Kubernetes ChaosMonkey"
  environment = "Development"
  resources = [
    digitalocean_droplet.cm_nonprod.urn
  ]
}
