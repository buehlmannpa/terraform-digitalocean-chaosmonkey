# Create NonProd Chaos-Monkey Droplet
resource "digitalocean_droplet" "cm_nonprod" {
  image  = "ubuntu-20-04-x64"
  name   = var.hostname
  region = var.region
  size   = "s-1vcpu-1gb"
  // -----> NOT TESTED!
  // base64 encrpyted /cloudinit/user-data.yaml (base64 /cloudinit/user-data.yaml) -> copy & paste output
  user_data = file("cloudinit/user-data")

  // https://www.digitalocean.com/community/tutorials/how-to-use-ansible-with-terraform-for-configuration-management

  provisioner "local-exec" {
    interpreter = ["bash", "-c"]
    command     = "sleep 1;"
  }

  provisioner "local-exec" {
    command = "sleep 20 && ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u chaosmonkey -i '${self.ipv4_address},' --private-key ${var.pvt_key} -e 'pub_key=${var.pub_key}' ansible/configuration.yaml"
  }
}

output "hostname" {
  value = resource.digitalocean_droplet.cm_nonprod.name
}

output "ip" {
  value = resource.digitalocean_droplet.cm_nonprod.ipv4_address
}
