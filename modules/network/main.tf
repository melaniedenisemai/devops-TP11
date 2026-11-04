terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

variable "project_name" { type = string }
variable "environment" { type = string }

resource "docker_network" "net_app" {
  name = "${var.project_name}-app-${var.environment}"
  labels {
    label = "managed-by"
    value = "terraform"
  }
  labels {
    label = "environment"
    value = var.environment
  }
}

resource "docker_network" "net_monitoring" {
  name = "${var.project_name}-monitoring-${var.environment}"
  labels {
    label = "managed-by"
    value = "terraform"
  }
  labels {
    label = "environment"
    value = var.environment
  }
}

output "net_app_name" {
  value = docker_network.net_app.name
}
