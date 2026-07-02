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

# Create a custom network for containers to communicate
resource "docker_network" "devops_network" {
  name   = "devops-network"
  driver = "bridge"
}

# Pull Ubuntu image for web server
resource "docker_image" "ubuntu" {
  name         = "ubuntu:22.04"
  keep_locally = false
}

# Pull Nginx image for reverse proxy
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# Container 1: Web App (Ubuntu with echo)
resource "docker_container" "web_app" {
  name     = "terraform-web-app"
  image    = docker_image.ubuntu.repo_digest
  must_run = true

  command = ["/bin/bash", "-c", "echo '🚀 DevOps Web App Running via Terraform IaC!' && sleep 3600"]

  networks_advanced {
    name = docker_network.devops_network.name
  }

  depends_on = [docker_network.devops_network]
}

# Container 2: Nginx Web Server
resource "docker_container" "nginx_server" {
  name     = "terraform-nginx"
  image    = docker_image.nginx.repo_digest
  must_run = true

  ports {
    internal = 80
    external = 8888
  }

  networks_advanced {
    name = docker_network.devops_network.name
  }

  depends_on = [docker_container.web_app, docker_network.devops_network]
}

# Outputs
output "web_app_container_id" {
  value       = docker_container.web_app.id
  description = "Web App Container ID"
}

output "nginx_container_id" {
  value       = docker_container.nginx_server.id
  description = "Nginx Container ID"
}

output "network_id" {
  value       = docker_network.devops_network.id
  description = "Docker Network connecting containers"
}