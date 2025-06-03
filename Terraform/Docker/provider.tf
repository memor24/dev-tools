terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"  # consider how images are created in kreuzwerker/docker
      version = ">= 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock" #to run docker daemon for local access by terraform
}