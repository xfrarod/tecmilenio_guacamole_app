terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "guacnetwork_compose" {
  name = "guacnetwork_compose"
}

resource "docker_container" "guacd" {
  image = "guacamole/guacd:${var.guacd_image_version}"
  name  = "guacd_compose_tf"
  networks_advanced {
    name = docker_network.guacnetwork_compose.name
  }
  volumes {
    container_path = "/drive"
    host_path      = "${var.host_volume_path}/drive"
    read_only      = false
  }
  volumes {
    container_path = "/record"
    host_path      = "${var.host_volume_path}/record"
    read_only      = false
  }
  restart = "always"
}

resource "docker_container" "postgres" {
  image = "postgres:${var.postgres_image_version}"
  name  = "postgres_guacamole_compose_tf"
  env = [
    "PGDATA=/var/lib/postgresql/data/guacamole",
    "POSTGRES_DB=${var.postgres_db}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_USER=${var.postgres_user}"
  ]
  networks_advanced {
    name = docker_network.guacnetwork_compose.name
  }
  volumes {
    container_path = "/docker-entrypoint-initdb.d"
    host_path      = "${var.host_volume_path}/init"
    read_only      = false
  }
  volumes {
    container_path = "/var/lib/postgresql/data"
    host_path      = "${var.host_volume_path}/data"
    read_only      = false
  }
  restart = "always"
}

resource "docker_container" "guacamole" {
  image = "guacamole/guacamole:${var.guacamole_image_version}"
  name  = "guacamole_compose_tf"
  depends_on = [
    docker_container.guacd,
    docker_container.postgres,
  ]
  env = [
    "GUACD_HOSTNAME=guacd",
    "POSTGRES_DATABASE=${var.postgres_db}",
    "POSTGRES_HOSTNAME=postgres",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_USER=${var.postgres_user}"
  ]
  networks_advanced {
    name = docker_network.guacnetwork_compose.name
  }
  ports {
    internal = 8080
    external = 8080
  }
  restart = "always"
}

output "guacamole_url" {
  value       = "http://localhost:8080/guacamole"
  description = "URL to access the Guacamole service"
}
