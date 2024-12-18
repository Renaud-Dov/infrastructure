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

data "vault_generic_secret" "cloudflare" {
  path = "secret/terraform/cloudflare"
}

provider "cloudflare" {
  api_token = data.vault_generic_secret.cloudflare.data.api_token

}