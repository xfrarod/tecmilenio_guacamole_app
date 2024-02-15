terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

# Pulls the database image
resource "docker_image" "postgres" {
  name = var.image
  keep_locally = true
}

# Creates database container
resource "docker_container" "postgres_guacamole_compose" {
  image = docker_image.postgres.image_id
  name  = "postgres_guacamole_compose"
  env = [
    "PGDATA=${var.PG_DATA}",
    "POSTGRES_DB=${var.PG_DB}",
    "POSTGRES_PASSWORD=${var.PG_PASS}",
    "POSTGRES_USER=${var.PG_USER}"
  ]
  networks_advanced { name = var.my_network}
  restart = "always"
  volumes {
    container_path = "../../docker-entrypoint-initdb.d"
  }
  volumes {
    container_path = "../../var/lib/postgresql/data"
  }
}
