# proton mail mx records

resource "cloudflare_dns_record" "mail_mx" {
  zone_id  = cloudflare_zone.bugbear.id
  name     = "@"
  type     = "MX"
  content  = "mail.protonmail.ch"
  priority = 10

  ttl     = 1
}

resource "cloudflare_dns_record" "mailsec_mx" {
  zone_id  = cloudflare_zone.bugbear.id
  name     = "@"
  type     = "MX"
  content  = "mailsec.protonmail.ch"
  priority = 20
  ttl     = 1
}

resource "cloudflare_dns_record" "protonmail_dkim1" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "protonmail._domainkey"
  type    = "CNAME"
  content = "protonmail.domainkey.dfjualtqrvxy5yfxd7awdgyecrj3klzhpwi4ixjtufbs46hjds3fq.domains.proton.ch."
  ttl     = 1
}

resource "cloudflare_dns_record" "protonmail_dkim2" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "protonmail2._domainkey"
  type    = "CNAME"
  content = "protonmail2.domainkey.dfjualtqrvxy5yfxd7awdgyecrj3klzhpwi4ixjtufbs46hjds3fq.domains.proton.ch."
  ttl     = 1
}

resource "cloudflare_dns_record" "protonmail_dkim3" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "protonmail3._domainkey"
  type    = "CNAME"
  content = "protonmail3.domainkey.dfjualtqrvxy5yfxd7awdgyecrj3klzhpwi4ixjtufbs46hjds3fq.domains.proton.ch."
  ttl     = 1
}

resource "cloudflare_dns_record" "protonmail_verification" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "@"
  type    = "TXT"
  content = "\"protonmail-verification=3deeceab60032072f91954b117b0968de648c30d\""
  ttl     = 1
}

resource "cloudflare_dns_record" "protonmail_spf" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "@"
  type    = "TXT"
  content = "\"v=spf1 include:_spf.protonmail.ch ~all\""
  ttl     = 1
}

resource "cloudflare_dns_record" "protonmail_dmarc" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "_dmarc"
  type    = "TXT"
  content = "\"v=DMARC1; p=quarantine\""
  ttl     = 1
}

# self hosted mail server

resource "cloudflare_dns_record" "mx1" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "mx1"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "bugbearmail_dkim" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "dkim._domainkey.mail"
  type    = "TXT"
  content = "\"v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwssweLhmnKrb/g9NWcQdSQSk68gZfLwUnFmY737O6Gb9HNkV++7+TRLCJ/U0iPk4FlC1T6WM2jQgHMo0VA/OlCjBeOsq2GyCtI20UbPgw2WPbLWtxo1kcGNJ7B4uAQDr/wJJd50UBtPNnAh6KzResNJ+DeMypFeAQMkpZImWjBa9uBgJHzL3SH0m+QmQKY/RrY5hdqJW+ozWkoWHAzQEpfz/36XZwzT2Mmx2DxIs+4Jqfq75YRuysL/H0SB1z99IctwbS1hf0RHksJhqzKFPWz/dl8UlQP5BZCj0ZXgBgLuu17UHWswRvRf6twd0pwyho4uRIVkq8HrgZ716EbGpxQIDAQAB\""
  ttl     = 1
}

# dmarc record
resource "cloudflare_dns_record" "bugbearmail_dmarc" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "_dmarc.mail"
  type    = "TXT"
  content = "\"v=DMARC1; p=reject; adkim=s; aspf=s\""
  ttl     = 1
}

resource "cloudflare_dns_record" "bugbearmail_spf" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "mail"
  type    = "TXT"
  content = "\"v=spf1 mx a:mx1.bugbear.fr ~all\""
  ttl     = 1
}

resource "cloudflare_dns_record" "bugbear_mx" {
  zone_id  = cloudflare_zone.bugbear.id
  name     = "mail"
  type     = "MX"
  content  = "mx1.bugbear.fr"
  priority = 10
  ttl     = 1
}


resource "cloudflare_dns_record" "mail" {
  zone_id = cloudflare_zone.bugbear.id
  name    = "mail"
  type    = "CNAME"
  content = "srv2.bugbear.fr"
  ttl     = 1
}