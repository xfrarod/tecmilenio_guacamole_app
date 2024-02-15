variable "guacd_image_version" {
  description = "The Docker image version for guacd"
  default     = "latest"
}

variable "postgres_image_version" {
  description = "The Docker image version for PostgreSQL"
  default     = "15.2-alpine"
}

variable "guacamole_image_version" {
  description = "La imagen de docker"
  default     = "latest"
}

variable "postgres_user" {
  description = "Nombre de usuario para postgres"
  default     = "guacamole_user"
}

variable "postgres_password" {
  description = "Contraseña para postgres"
}

variable "postgres_db" {
  description = "Nombre de base de datos de PostgreSQL"
  default     = "guacamole_db"
}

variable "host_volume_path" {
  description = "Para montar volumenes"
  type        = string
  default     = "/home/tonyglz/Documents/docker-volumes"
}
