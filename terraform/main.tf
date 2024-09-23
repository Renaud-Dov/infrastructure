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

  # TODO: Fix the backend configuration
#   backend "s3" {
#
#     endpoints = {
#       s3 = "https://s3.bugbear.fr"
#     }
#     bucket = "terraform-state-bugbear"
#     key    = "terraform.tfstate"
#     region = "default"
#
#     use_path_style              = true
#     skip_requesting_account_id  = true
#     skip_credentials_validation = true
#     skip_metadata_api_check     = true
#     skip_region_validation      = true
#     skip_s3_checksum            = true
#
#   }
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