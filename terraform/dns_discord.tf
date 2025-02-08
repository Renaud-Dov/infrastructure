resource "cloudflare_record" "discord_verification" {
  zone_id = data.cloudflare_zone.this.id
  name    = "_discord"
  type    = "TXT"
  content = "\"dh=cfd42a268e81d5a6dc0b7ca8fc3e801b0a4b602e\""
}