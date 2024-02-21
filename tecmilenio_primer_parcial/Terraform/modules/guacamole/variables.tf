variable "my_network" {
    type = string
}

variable "internal_port" {
    type = string
    default = "8080"
}

variable "external_port" {
    type = string
    default = "8080"
}

variable "GD_HOSTNAME" {
    type = string
    default = "postgres"    
}

variable "PG_DB" {
    type = string
    default = "guacamole_db"    
}

variable "PG_HOSTNAME" {
    type = string
    default = "postgres"    
}

variable "PG_PASS" {
    type = string
    default = "ChooseYourOwnPasswordHere1234"
    sensitive = true  
}

variable "PG_USER" {
    type = string
    default = "guacamole_user"    
}