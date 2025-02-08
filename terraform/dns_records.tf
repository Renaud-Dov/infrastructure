resource "cloudflare_dns_record" "srv1" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "srv1"
  type    = "A"
  content = "23.88.110.202"
  ttl     = 1
}

resource "cloudflare_dns_record" "poseidon" {
  zone_id    = cloudflare_zone.bugbear.id
  name       = "srv2"
  type       = "A"
  content    = hcloud_primary_ip.poseidon.ip_address
  depends_on = [hcloud_primary_ip.poseidon]
  ttl     = 1
}

resource "cloudflare_dns_record" "hera" {
  zone_id    = cloudflare_zone.bugbear.id
  name       = "hera.srv.bugbear.fr"
  type       = "A"
  content    = hcloud_primary_ip.hera.ip_address
  depends_on = [hcloud_primary_ip.hera]
  ttl     = 1
}


resource "cloudflare_dns_record" "argocd" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "argocd"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "auth" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "auth"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "bugbear" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "@"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "www" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "www"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "grafana" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "grafana"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "minio" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "minio"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "s3" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "s3"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "status" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "status"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "vault" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "vault"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  proxied = true
  ttl     = 1
}
