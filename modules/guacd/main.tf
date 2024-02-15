terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

resource "docker_image" "guacd" {
  name = "guacamole/guacd"
  keep_locally = true
}

resource "docker_container" "guacd_container" {
  image = docker_image.guacd.image_id
  name  = "guacd_compose"
  networks_advanced { name = var.my_network}
  restart = "always"
  volumes {
    container_path = "../../drive"
  }
  volumes {
    container_path = "../../record"
  }
}