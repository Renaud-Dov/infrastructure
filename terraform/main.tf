terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.8.2"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }

  }

  backend "http" {}
}

provider "vault" {
  # TODO: i cannot use the vault that being deployed by terraform, find another way
  address = "https://vault.bugbear.fr"
  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = var.role_id
      secret_id = var.secret_id
    }
  }
}


provider "cloudflare" {
  api_token = var.cloudflare_token
}

provider "hcloud" {
  token = var.hcloud_token
}