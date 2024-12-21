resource "hcloud_network" "bastion" {
  name              = "bastion"
  ip_range          = "10.0.0.0/16"
  delete_protection = true
}

resource "hcloud_network_subnet" "bastion-subnet" {
  type         = "cloud"
  network_id   = hcloud_network.bastion.id
  network_zone = "eu-central"
  ip_range     = "10.0.1.0/24"
}