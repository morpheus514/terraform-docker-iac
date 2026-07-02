variable "container_name" {
  description = "Name of the Docker container"
  type        = string
  default     = "terraform-devops-app"
}

variable "image_name" {
  description = "Docker image to use"
  type        = string
  default     = "ubuntu:22.04"
}

variable "container_port" {
  description = "Port to expose"
  type        = number
  default     = 8080
}