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

  provisioner "remote-exec" {
    inline = ["sudo apt update", "sudo apt install python3 -y", "echo Done!"]

    connection {
      host        = self.ipv4_address
      type        = "ssh"
      user        = "root"
      private_key = file(var.pvt_key)
    }
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u chaosmonkey -i '${self.ipv4_address},' --private-key ${var.pvt_key} -e 'pub_key=${var.pub_key}' ansible/configuration.yaml"
  }
}

output "hostname" {
  value = resource.digitalocean_droplet.cm_nonprod.name
}

output "ip" {
  value = resource.digitalocean_droplet.cm_nonprod.ipv4_address
}