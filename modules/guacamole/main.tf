terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

resource "docker_image" "guacamole" {
  name = "guacamole/guacamole"
  keep_locally = true
}

resource "docker_container" "guacamole_container" {
  image = docker_image.guacamole.image_id
  name  = "guacamole_compose"
  networks_advanced { name = var.my_network}
  restart = "always"
  ports {
    internal = var.internal_port
    external = var.external_port
    protocol = "tcp"
  }
  env = [
    "GUACD_HOSTNAME=${var.GD_HOSTNAME}",
    "POSTGRES_DATABASE=${var.PG_DB}",
    "POSTGRES_HOSTNAME=${var.PG_HOSTNAME}",
    "POSTGRES_PASSWORD=${var.PG_PASS}",
    "POSTGRES_USER=${var.PG_USER}"
  ]
}



