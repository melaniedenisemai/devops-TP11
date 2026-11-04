variable "container_name" {
  type        = string
  description = "Nombre del contenedor Docker"
  default     = "devops-app"
}

variable "network_name" {
  type        = string
  description = "Nombre de la red Docker"
  default     = "devops-app-net"
}

variable "volume_name" {
  type        = string
  description = "Nombre del volumen Docker"
  default     = "devops-app-data"
}

variable "docker_image" {
  type        = string
  description = "Imagen de Docker a desplegar"
  default     = "python:3.12-slim"
}
