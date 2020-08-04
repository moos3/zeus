locals {
  project_sa_gce = format("%s:%s-compute@developer.gserviceaccount.com,", "serviceAccount", var.project_number)
}

module "sa-mbot-bucket-creator" {
  # we can improve this once we move modules to another git repo
  source = "git@github.com:makerbot/zeus.git//modules/service-account"

  account_id   = "sa-mbot-bucket-creator"
  display_name = "Bucket DNS Naming Delegate for mbot.me"
  project_id   = var.project_id
}

module "subnet_private_1" {
  # we can improve this once we move modules to another git repo
  source = "git@github.com:makerbot/zeus.git//modules/subnet"

  host_project_id          = var.host_project_id
  subnets                  = var.subnets
  network_self_link        = var.network_self_link
  project_id               = var.project_id
}

locals {
  host_sa = {
    for subnet in module.subnet_private_1.subnet_names : 
     "${subnet}" => local.project_sa_gce 
  }
}

module "svpc-access" {
  source  = "terraform-google-modules/network/google//modules/fabric-net-svpc-access"
  version = "~> 2.1.1"

  host_project_id     = var.host_project_id
  service_project_num = 1
  service_project_ids = list(var.project_id)
  host_subnets        = module.subnet_private_1.subnet_names
  host_subnet_regions = module.subnet_private_1.subnet_regions

  host_subnet_users = local.host_sa
}

resource "google_project_iam_member" "compute_network_user_cloudservices" { 
      project = var.host_project_id
      role    = "roles/compute.networkUser" 
      member  = "serviceAccount:${var.project_number}@cloudservices.gserviceaccount.com"
}

resource "google_project_iam_member" "host_service_agent" { 
     project = var.host_project_id
     role    = "roles/container.hostServiceAgentUser" 
     member  = "serviceAccount:service-${var.host_project_number}@container-engine-robot.iam.gserviceaccount.com" 
}

resource "google_project_iam_member" "compute_network_user_container" { 
     project = var.project_id
     role    = "roles/compute.networkUser" 
     member  = "serviceAccount:service-${var.project_number}@container-engine-robot.iam.gserviceaccount.com"
}