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

variable "project_name" {
  type    = string
  default = "devops-portfolio"
}

variable "environment" {
  type    = string
  default = "dev"
}

module "network" {
  source       = "./envs/dev/modules/network"
  project_name = var.project_name
  environment  = var.environment
}

module "storage" {
  source       = "./envs/dev/modules/storage"
  project_name = var.project_name
  environment  = var.environment
}

module "app" {
  source            = "./envs/dev/modules/app"
  project_name      = var.project_name
  environment       = var.environment
  net_app_name      = module.network.net_app_name
  vol_postgres_name = module.storage.vol_postgres_name
}
