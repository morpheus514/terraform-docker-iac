# Configure the Docker provider
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

# Pull a Docker image (Ubuntu)
resource "docker_image" "ubuntu" {
  name         = "ubuntu:22.04"
  keep_locally = false
}

# Create a Docker container
resource "docker_container" "web_app" {
  name  = "terraform-devops-container"
  image = docker_image.ubuntu.repo_digest

  # Container runs a simple command
  command = ["/bin/bash", "-c", "echo 'Container running! DevOps IaC works!' && sleep 300"]

  # Keep container running
  must_run = true
}

# Output container info
output "container_id" {
  value       = docker_container.web_app.id
  description = "The ID of the created container"
}

output "container_name" {
  value       = docker_container.web_app.name
  description = "The name of the created container"
}