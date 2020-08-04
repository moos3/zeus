# terraform version to use
terraform {
  required_version = "~> 0.12"
}

# default project definition
resource "google_project" "default" {
  name            = format("%s-%s", var.company_id, var.project_name)
  project_id      = format("%s-%s", var.company_id, var.project_id)
  folder_id       = var.folder_id
  billing_account = var.billing_account

  labels = {
    contact     = var.contact
    team        = var.team
    created_via = "terraform"
  }

  # billing is handled via Org-level account administration
  lifecycle {
    ignore_changes = [
      billing_account,
    ]
  }
}

# enable the various APIs specified
resource "google_project_service" "default" {
  # this is hacky for empty lists but cannot be fixed until 0ce65404 is released in Terraform
  for_each = { for v in concat(var.enabled_api_services, var.enabled_api_extraservices) : v => v }

  project            = google_project.default.project_id
  service            = each.value
  disable_on_destroy = true
}


# if this is a service project, declare as a service project of a host project
resource "google_compute_shared_vpc_service_project" "default" {
  host_project    = var.host_project_id
  service_project = google_project.default.project_id
}

