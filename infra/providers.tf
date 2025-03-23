terraform {
  required_providers {
    bunnynet = {
      source = "BunnyWay/bunnynet"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.1"
    }
  }
}

provider "bunnynet" {
  api_key = var.bunny_key
}

