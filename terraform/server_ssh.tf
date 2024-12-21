

resource "hcloud_ssh_key" "main" {
  name       = "main"
  public_key = var.public_key
}
