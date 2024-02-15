terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
}

resource "docker_network" "local_network" {
  name = var.my_global_network
  driver = "bridge"
  attachable = true
}

module database {
  source = "./modules/database"
  my_network = var.my_global_network
}

module guacd {
  source = "./modules/guacd"
  my_network = var.my_global_network
}

module guacamole {
  source = "./modules/guacamole"
  my_network = var.my_global_network
}