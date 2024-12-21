
resource "hcloud_primary_ip" "poseidon" {

  name          = "primary-ip-poseidon"
  datacenter    = "nbg1-dc3"
  type          = "ipv4"
  assignee_type = "server"
  auto_delete   = false
}

resource "hcloud_server" "poseidon" {
  name        = "poseidon"
  image       = "ubuntu-24.04"
  server_type = "cax31"
  location    = "nbg1"
  ssh_keys    = [hcloud_ssh_key.main.id]
  public_net {
    ipv4_enabled = true
    ipv4         = hcloud_primary_ip.poseidon.id
    ipv6_enabled = true
  }
  network {
    network_id = hcloud_network.bastion.id
    ip         = "10.0.1.3"
  }
  backups = true

  delete_protection        = true
  rebuild_protection       = true
  shutdown_before_deletion = true

  lifecycle {
    # We dont want the server to be replaced due to changes in the ssh_keys
    ignore_changes = [ssh_keys]
  }
}