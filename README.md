# terraform-digitalocean-chaosmonkey

[![Module version badge](https://img.shields.io/badge/Module-v1.0.0-green)](https://shields.io/)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_volume.chaosmonkey](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/volume) | resource |
| [digitalocean_droplet.chaosmonkey](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/droplet) | resource |
| [digitalocean_volume_attachment.chaosmonkey](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/volume_attachment) | resource |
| [digitalocean_project.chaosmonkey](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_do_token"></a> [digitalocean\_do_token](#input\_digitalocean\_do_token) | Digital Ocean Token to authenticate against the Digital Ocean cli-tool | `string` | n/a | yes |
| <a name="input_pvt_key"></a> [ssh\_pvt_key](#input\_ssh\_pvt_key) | Private SSH-Key path for the ssh connection | `string` | `"/home/buehlmannpa/.ssh/id_rsa"` | yes |
| <a name="input_pub_key"></a> [ssh\_pub_key](#input\_ssh\_pub_key) | Pulbic SSH-Key path for the ssh connection | `string` | `"/home/buehlmannpa/.ssh/id_rsa.pub"` | yes |
| <a name="input_region"></a> [digitalocean\_region](#input\_digitalocean\_region) | VPC regiion where the componentes where deployed | `string` | `"fra1"` | yes |
| <a name="input_hostname"></a> [digitalocean\_hostname](#input\_digitalocean\_hostname) | Name of the chaos-monkey host | `string` | `"vlscmn-fra1"` | yes |
| <a name="input_droplet_image"></a> [digitalocean\_droplet_image](#input\_digitalocean\_droplet_image) | Droplet image of the chaos-monkey host | `string` | `"ubuntu-20-04-x64"` | no |
| <a name="input_droplet_size"></a> [digitalocean\_droplet_size](#input\_digitalocean\_droplet_size) | Droptlet size of the chaos-monkey host | `string` | `"s-1vcpu-1gb"` | no |
| <a name="input_volume_name"></a> [digitalocean\_volume_name](#input\_digitalocean\_volume_name) | Volume name of the chaos-monkey host volume | `string` | `"vlscmn-fra1-vol1"` | yes |
| <a name="input_volume_size"></a> [digitalocean\_volume_size](#input\_digitalocean\_volume_size) | Volume size of the chaos-monkey host volume (GB) | `number` | `"5"` | yes |
| <a name="input_volume_filesystem_type"></a> [digitalocean\_volume_filesystem_type](#input\_digitalocean\_volume_filesystem_type) | Filesystem type of the chaos-monkey host volume | `string` | `"ext4"` | no |

## Outputs

| Name | Description |
|------|---------|
| <a name="output_hostname"></a> [hostname](#output\_hostname) | `"Name of the Digital Ocean Droplet"` |
| <a name="provider_ip"></a> [ip](#output\_ip) | `"IP of the Digital Ocean Droplet"` |
<!-- END_TF_DOCS -->

## Example usage

### Execute the Git-Repository via terraform on the command line
```bash
git clone https://github.com/buehlmannpa/terraform-digitalocean-chaosmonkey
cd terraform-digitalocean-chaosmonkey
terraform apply -auto-approve

ssh chaosmonkey@<ip_address>
```

### Use the Git-Repository as a module
```hcl
module "terraform-digitalocean-chaosmonkey" {
  source      = "git::ssh://git@github.com/buehlmannpa/terraform-digitalocean-chaosmonkey.git?ref=main"

  do_token    = var.collectord_license_key
  pvt_key     = var.pvt_key
  pub_key     = var.pub_key
  region      = var.region
  hostname    = var.hostname
  volume_name = var.volume_name
  volume_size = var.volume_size
}
```

