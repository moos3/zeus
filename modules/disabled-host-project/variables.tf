variable "billing_account" {}

variable "contact" {}

variable "default_service_account" {
    type = string
    description = "keep/disable/remove are valid options here"
    default = "keep"
}

variable "team" {}

variable "folder_id" {
    type = string
    description = "folder id where project is going to be created"
}

variable "name" {
    type = string
    description = "Project name"
}

variable "org_id" {}

variable "project_id" {
    type = string
    description = "project id"
}