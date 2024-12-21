terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.16"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.8.2"
    }
  }

  backend "http" {}
}


provider "vault" {
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

}