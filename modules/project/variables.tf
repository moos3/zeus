variable "billing_account" {}

variable "company_id" {}

variable "contact" {}

variable "default_service_account" {
  type        = string
  description = "keep/disable/remove are valid options here"
  default     = "disable"
}

variable "enabled_api_extraservices" {
  description = "Extra API services to enable for the project"
  type        = list(string)
  default     = []
}

variable "enabled_api_services" {
  description = "Default api services enabled for all projects (defined globally in terragrunt)"
  type        = list(string)
}

variable "folder_id" {
  type        = string
  description = "Folder id where project is going to be created"
}

variable "org_id" {}

variable "project_name" {
  type        = string
  description = "Project name"
}

variable "project_id" {
  type        = string
  description = "The ID of the project in which the resource belongs."
}

variable "team" {}
