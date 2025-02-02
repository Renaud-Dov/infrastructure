resource "cloudflare_record" "mail_mx" {
  zone_id  = data.cloudflare_zone.this.id
  name     = "@"
  type     = "MX"
  content  = "mail.protonmail.ch"
  priority = 10

}

resource "cloudflare_record" "mailsec_mx" {
  zone_id  = data.cloudflare_zone.this.id
  name     = "@"
  type     = "MX"
  content  = "mailsec.protonmail.ch"
  priority = 20
}

resource "cloudflare_record" "protonmail_domainkey" {
  zone_id = data.cloudflare_zone.this.id
  name    = "protonmail._domainkey"
  type    = "CNAME"
  content = "protonmail.domainkey.dfjualtqrvxy5yfxd7awdgyecrj3klzhpwi4ixjtufbs46hjds3fq.domains.proton.ch."
}

resource "cloudflare_record" "protonmail2_domainkey" {
  zone_id = data.cloudflare_zone.this.id
  name    = "protonmail2._domainkey"
  type    = "CNAME"
  content = "protonmail2.domainkey.dfjualtqrvxy5yfxd7awdgyecrj3klzhpwi4ixjtufbs46hjds3fq.domains.proton.ch."
}

resource "cloudflare_record" "protonmail3_domainkey" {
  zone_id = data.cloudflare_zone.this.id
  name    = "protonmail3._domainkey"
  type    = "CNAME"
  content = "protonmail3.domainkey.dfjualtqrvxy5yfxd7awdgyecrj3klzhpwi4ixjtufbs46hjds3fq.domains.proton.ch."
}