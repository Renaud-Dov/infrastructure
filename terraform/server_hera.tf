
resource "hcloud_primary_ip" "hera" {

  name          = "primary-ip-hera"
  datacenter    = "nbg1-dc3"
  type          = "ipv4"
  assignee_type = "server"
  auto_delete   = false
}

resource "hcloud_server" "hera" {
  name        = "hera"
  image       = "ubuntu-24.04"
  server_type = "cx32"
  location    = "nbg1"
  ssh_keys    = [hcloud_ssh_key.main.id]
  public_net {
    ipv4_enabled = true
    ipv4         = hcloud_primary_ip.hera.id
    ipv6_enabled = true
  }
  network {
    network_id = hcloud_network.bastion.id
    ip         = "10.0.1.2"
  }

  delete_protection  = true
  rebuild_protection = true

  lifecycle {
    # We dont want the server to be replaced due to changes in the ssh_keys
    ignore_changes = [ssh_keys]
  }
}