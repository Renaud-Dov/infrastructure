# proton mail mx records

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

resource "cloudflare_record" "protonmail_dkim1" {
  zone_id = data.cloudflare_zone.this.id
  name    = "protonmail._domainkey"
  type    = "CNAME"
  content = "protonmail.domainkey.dfjualtqrvxy5yfxd7awdgyecrj3klzhpwi4ixjtufbs46hjds3fq.domains.proton.ch."
}

resource "cloudflare_record" "protonmail_dkim2" {
  zone_id = data.cloudflare_zone.this.id
  name    = "protonmail2._domainkey"
  type    = "CNAME"
  content = "protonmail2.domainkey.dfjualtqrvxy5yfxd7awdgyecrj3klzhpwi4ixjtufbs46hjds3fq.domains.proton.ch."
}

resource "cloudflare_record" "protonmail_dkim3" {
  zone_id = data.cloudflare_zone.this.id
  name    = "protonmail3._domainkey"
  type    = "CNAME"
  content = "protonmail3.domainkey.dfjualtqrvxy5yfxd7awdgyecrj3klzhpwi4ixjtufbs46hjds3fq.domains.proton.ch."
}

resource "cloudflare_record" "protonmail_verification" {
  zone_id = data.cloudflare_zone.this.id
  name    = "@"
  type    = "TXT"
  content = "\"protonmail-verification=3deeceab60032072f91954b117b0968de648c30d\""
}

resource "cloudflare_record" "protonmail_spf" {
  zone_id = data.cloudflare_zone.this.id
  name    = "@"
  type    = "TXT"
  content = "\"v=spf1 include:_spf.protonmail.ch ~all\""
}

resource "cloudflare_record" "protonmail_dmarc" {
  zone_id = data.cloudflare_zone.this.id
  name    = "_dmarc"
  type    = "TXT"
  content = "\"v=DMARC1; p=quarantine\""
}

# self hosted mail server

resource "cloudflare_record" "mx1" {
  zone_id = data.cloudflare_zone.this.id
  name    = "mx1"
  type    = "CNAME"
  content = cloudflare_record.poseidon.hostname
  proxied = false
}

resource "cloudflare_record" "bugbearmail_dkim" {
  zone_id = data.cloudflare_zone.this.id
  name    = "dkim._domainkey.mail"
  type    = "TXT"
  content = "\"v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwssweLhmnKrb/g9NWcQdSQSk68gZfLwUnFmY737O6Gb9HNkV++7+TRLCJ/U0iPk4FlC1T6WM2jQgHMo0VA/OlCjBeOsq2GyCtI20UbPgw2WPbLWtxo1kcGNJ7B4uAQDr/wJJd50UBtPNnAh6KzResNJ+DeMypFeAQMkpZImWjBa9uBgJHzL3SH0m+QmQKY/RrY5hdqJW+ozWkoWHAzQEpfz/36XZwzT2Mmx2DxIs+4Jqfq75YRuysL/H0SB1z99IctwbS1hf0RHksJhqzKFPWz/dl8UlQP5BZCj0ZXgBgLuu17UHWswRvRf6twd0pwyho4uRIVkq8HrgZ716EbGpxQIDAQAB\""
}

# dmarc record
resource "cloudflare_record" "bugbearmail_dmarc" {
  zone_id = data.cloudflare_zone.this.id
  name    = "_dmarc.mail"
  type    = "TXT"
  content = "\"v=DMARC1; p=reject; adkim=s; aspf=s\""
}

resource "cloudflare_record" "bugbearmail_spf" {
  zone_id = data.cloudflare_zone.this.id
  name    = "mail"
  type    = "TXT"
  content = "\"v=spf1 mx a:mx1.bugbear.fr ~all\""
}

resource "cloudflare_record" "bugbear_mx" {
  zone_id  = data.cloudflare_zone.this.id
  name     = "mail"
  type     = "MX"
  content  = cloudflare_record.mx1.hostname
  priority = 10
}


resource "cloudflare_record" "mail" {
  zone_id = data.cloudflare_zone.this.id
  name    = "mail"
  type    = "CNAME"
  content = cloudflare_record.poseidon.hostname
}