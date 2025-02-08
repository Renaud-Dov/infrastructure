resource "cloudflare_dns_record" "discord_verification" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "_discord"
  type    = "TXT"
  content = "\"dh=cfd42a268e81d5a6dc0b7ca8fc3e801b0a4b602e\""
  ttl = 86400 # 24h
}