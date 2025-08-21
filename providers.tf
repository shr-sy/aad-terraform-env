terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.50.0"
    }
  }

  backend "remote" {
    organization = "your-hcp-org"
    workspaces { name = "aad-terraform" }
  }
}

provider "azuread" {}
