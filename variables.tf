variable "project_name" {
  type    = string
  default = "devops-portfolio"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "backend_replicas" {
  type    = number
  default = 1
}
