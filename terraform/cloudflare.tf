resource "cloudflare_zone" "bugbear" {
  account = {
    id = var.cloudflare_account_id
  }
  name = var.domain_name
}
