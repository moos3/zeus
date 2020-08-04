locals {
  full_project_name = format("%s-%s", var.company_id, var.project_name)
  full_project_id   = format("%s-%s", var.company_id, var.project_id)
  labels = {
    team       = var.team,
    contact    = var.contact,
    created_by = "terraform"
  }
}

module "project" {
  source = "terraform-google-modules/project-factory/google"

  activate_apis           = concat(var.enabled_api_services, var.enabled_api_extraservices)
  billing_account         = var.billing_account
  default_service_account = var.default_service_account
  folder_id               = var.folder_id
  labels                  = local.labels
  name                    = local.full_project_name
  org_id                  = var.org_id
  #project_id              = local.full_project_id
  random_project_id = true
}
