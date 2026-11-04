terraform {
  required_version = ">= 1.0.0"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {}

module "network" {
  source = "./modules/network"
}

module "storage" {
  source = "./modules/storage"
}

module "app" {
  source            = "./modules/app"
  net_app_name      = module.network.net_app_name
  vol_postgres_name = module.storage.vol_postgres_name
}
