terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

resource "docker_volume" "vol_postgres" {
  name = "${var.project_name}-postgres-${var.environment}"
  labels {
    label = "managed-by"
    value = "terraform"
  }
}

resource "docker_volume" "vol_grafana" {
  name = "${var.project_name}-grafana-${var.environment}"
  labels {
    label = "managed-by"
    value = "terraform"
  }
}

resource "docker_volume" "vol_prometheus" {
  name = "${var.project_name}-prometheus-${var.environment}"
  labels {
    label = "managed-by"
    value = "terraform"
  }
}

output "vol_postgres_name" {
  value = docker_volume.vol_postgres.name
}
