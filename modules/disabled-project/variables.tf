variable "company_id" {}

variable "project_name" {
  description = "The name to use for this Project"
  type        = string
}

variable "project_id" {
  description = "The ID to use for this Project"
  type        = string
}

variable "folder_id" {
  description = "The folder id where this Project will be created "
  type        = string
}

variable "billing_account" {
  description = "The billing account to associate with this Project"
  type        = string
}

variable "org_id" {
  description = "The ID of the organization this project will belong to"
  type        = string
}

variable "contact" {
  description = "The contact for this Project"
  type        = string
}

variable "team" {
  description = "The team which will utilize this project"
  type        = string
}

variable "enabled_api_services" {
  description = "Which API services to enable for the project - note you don't need to include compute as this is enabled by default"
  type        = list(string)
}

variable "enabled_api_extraservices" {
  description = "Extra API services to enable for the project"
  type        = list(string)
  default     = []
}

variable "host_project_id" {
  description = "project_id of the host project"
  type        = string
}

