terraform {
    required_providers {
      docker = {
        source = "kreuzwerker/docker"
        version = "3.0.2"
      }
    }
}


resource "docker_image" "db" {
    name = "postgres:14"
    keep_locally = true 
}

resource "docker_container" "db" {
 image = docker_image.db.image_id
 name = "db"
 env = [
  "POSTGRES_USER=user"
  "POSTGRES_PASSWORD=pass",
  "POSTGRES_DB=feedback"

 ]
 networks_advanced {
   name = var.my_network
 }
}