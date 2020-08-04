
variable "prefix_length" {
    description = "Prefix Length for generating private IP allocation"
    default = 16
}

variable "private_ip_name" {
    description = "name of private IP allocation block"
}

variable "peering_network" {
    description = "peering network id"
}

variable "project_id" {
    description = "project id"
}