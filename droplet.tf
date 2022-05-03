# Create NonProd Volume for Chaos-Monkey Droplet
resource "digitalocean_volume" "chaosmonkey" {
  region                  = var.region
  name                    = var.volume_name
  size                    = var.volume_size
  initial_filesystem_type = var.volume_filesystem_type
}

# Create NonProd Chaos-Monkey Droplet
resource "digitalocean_droplet" "chaosmonkey" {
  image     = var.droplet_image
  name      = var.hostname
  region    = var.region
  size      = var.droplet_size
  user_data = file("cloudinit/user-data")

  provisioner "local-exec" {
    command = "sleep 20 && ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u chaosmonkey -i '${self.ipv4_address},' --private-key ${var.pvt_key} -e 'pub_key=${var.pub_key}' ansible/configuration.yaml"
  }
}

# Attach Volume to Droplet
resource "digitalocean_volume_attachment" "chaosmonkey" {
  droplet_id = digitalocean_droplet.chaosmonkey.id
  volume_id  = digitalocean_volume.chaosmonkey.id
}

output "hostname" {
  value = resource.digitalocean_droplet.chaosmonkey.name
}

output "ip" {
  value = resource.digitalocean_droplet.chaosmonkey.ipv4_address
}
