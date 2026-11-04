terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

resource "docker_image" "python" {
  name = "python:3.12-slim"
}

resource "docker_container" "postgres" {
  name  = "postgres"
  image = docker_image.python.image_id
  command = ["python3", "-c", "import time; time.sleep(86400)"]
  networks_advanced { name = var.net_app_name }
  mounts {
    target = "/var/lib/postgresql/data"
    source = var.vol_postgres_name
    type   = "volume"
  }
  labels {
    label = "managed-by"
    value = "terraform"
  }
}

resource "docker_container" "backend" {
  name  = "backend"
  image = docker_image.python.image_id
  command = ["python3", "-c", "import time; time.sleep(86400)"]
  networks_advanced { name = var.net_app_name }
  labels {
    label = "managed-by"
    value = "terraform"
  }
}

resource "docker_container" "frontend" {
  name  = "frontend"
  image = docker_image.python.image_id
  command = ["python3", "-c", "import time; time.sleep(86400)"]
  networks_advanced { name = var.net_app_name }
  ports {
    internal = 80
    external = 8080
  }
  labels {
    label = "managed-by"
    value = "terraform"
  }
}

output "app_url" {
  value = "http://localhost:8080"
}
