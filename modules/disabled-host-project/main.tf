locals {
    labels = { team = var.team, contact = var.contact, created_by = "terraform" }
}

module "project-svpc" {
    source = "terraform-google-modules/project-factory/google"

    billing_account = var.billing_account
    default_service_account = var.default_service_account
    folder_id = var.folder_id
    labels = local.labels
    name = var.name
    org_id = var.org_id
    random_project_id = true
}