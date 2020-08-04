variable "activation_policy" {
    description = "activation policy"
    default = "ALWAYS"
}


variable "authorized_network" {
    description = "authorized_network"
}

variable "database_version" {
    description = "version of the database"
    default = "MYSQL_5_7"
}
variable "additional_users" {
    description = "list of users to be added to the database"
    default = ["app-user","read-only"]
    type = list
}

variable "database_name" {
    description = "name of the database"
    type = string
}

variable "project_id" {
    description = "project id of the database, inherit this from the service-project module"
    type = string
}

variable "database_region" {
    description = "name of the region the database will reside in"
    default = "us-east1"
    type = string
}