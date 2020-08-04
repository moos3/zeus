variable "service_account_name" {
    type = string 
    description = "Name of the service account"
}

variable "service_account_project_roles" {
    type = list(string) 
    description = "list of project roles, this is unnecessary, we'll tie service accounts to specific permissions"
    default = []
}

variable "service_account_display_name" {
    type = string 
    description = "human readable display name"
}

variable "service_account_description" {
    type = string 
    description = "what the service account does"
}

variable "service_account_project_id" {
    type = string
    description = "project id that the SA lives in"
}

variable "service_account_prefix" {
    type = string 
    description = "prefix of the service account"
    default = "sa"
}