variable "my_network" {
    type = string
}

variable "image" {
    type = string
    default = "postgres:15.2-alpine"
}

variable "PG_DATA" {
    type = string
    default = "/var/lib/postgresql/data/guacamole"    
}

variable "PG_DB" {
    type = string
    default = "guacamole_db"    
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