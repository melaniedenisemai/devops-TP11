module "network" {
  source       = "./modules/network"
  project_name = var.project_name
  environment  = var.environment
}

module "storage" {
  source       = "./modules/storage"
  project_name = var.project_name
  environment  = var.environment
}

module "app" {
  source            = "./modules/app"
  project_name      = var.project_name
  environment       = var.environment
  backend_replicas  = var.backend_replicas
  net_app_name      = module.network.net_app_name
  vol_postgres_name = module.storage.vol_postgres_name
}
