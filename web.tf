variable "image" {}

resource "docker_container" "web" {
  name  = "web_image"
  image = var.image
  network_mode = docker_network.guacnetwork_compose.name
}
