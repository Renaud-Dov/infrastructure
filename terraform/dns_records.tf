resource "cloudflare_record" "srv1" {
  zone_id = data.cloudflare_zone.this.id
  name    = "srv1"
  type    = "A"
  content = "23.88.110.202"
}

resource "cloudflare_record" "poseidon" {
  zone_id    = data.cloudflare_zone.this.id
  name       = "srv2"
  type       = "A"
  content    = hcloud_primary_ip.poseidon.ip_address
  depends_on = [hcloud_primary_ip.poseidon]
}

resource "cloudflare_record" "hera" {
  zone_id    = data.cloudflare_zone.this.id
  name       = "hera.srv.bugbear.fr"
  type       = "A"
  content    = hcloud_primary_ip.hera.ip_address
  depends_on = [hcloud_primary_ip.hera]
}


resource "cloudflare_record" "argocd" {
  zone_id = data.cloudflare_zone.this.id
  name    = "argocd"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  proxied = true
}

resource "cloudflare_record" "auth" {
  zone_id = data.cloudflare_zone.this.id
  name    = "auth"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  proxied = true
}

resource "cloudflare_record" "bugbear" {
  zone_id = data.cloudflare_zone.this.id
  name    = "@"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  proxied = true
}

resource "cloudflare_record" "www" {
  zone_id = data.cloudflare_zone.this.id
  name    = "www"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  proxied = true
}

resource "cloudflare_record" "grafana" {
  zone_id = data.cloudflare_zone.this.id
  name    = "grafana"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  proxied = true
}

resource "cloudflare_record" "minio" {
  zone_id = data.cloudflare_zone.this.id
  name    = "minio"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  proxied = true
}

resource "cloudflare_record" "s3" {
  zone_id = data.cloudflare_zone.this.id
  name    = "s3"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  proxied = true
}

resource "cloudflare_record" "status" {
  zone_id = data.cloudflare_zone.this.id
  name    = "status"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  proxied = true
}

resource "cloudflare_record" "vault" {
  zone_id = data.cloudflare_zone.this.id
  name    = "vault"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  proxied = true
}
