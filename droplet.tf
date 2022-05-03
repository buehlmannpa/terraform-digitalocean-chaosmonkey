# Create NonProd Volume for Chaos-Monkey Droplet
resource "digitalocean_volume" "cm_nonprod" {
  region                  = var.region
  name                    = var.volumename
  size                    = var.volume_size
  initial_filesystem_type = var.volume_filesystem_type
}

# Create NonProd Chaos-Monkey Droplet
resource "digitalocean_droplet" "cm_nonprod" {
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
resource "digitalocean_volume_attachment" "cm_nonprod" {
  droplet_id = digitalocean_droplet.cm_nonprod.id
  volume_id  = digitalocean_volume.cm_nonprod.id
}

output "hostname" {
  value = resource.digitalocean_droplet.cm_nonprod.name
}

output "ip" {
  value = resource.digitalocean_droplet.cm_nonprod.ipv4_address
}
