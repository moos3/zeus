# ---------------------------------------------------------------------------------------------------------------------
# GLOBAL PARAMETERS
# These variables apply to all configurations in this subfolder. These are automatically merged into the child
# `terragrunt.hcl` config via the include block.
# ---------------------------------------------------------------------------------------------------------------------

locals {
  contact           = "devops"                             # default contact
  company_id        = "zeus"                                 # any string to identify the company for better resources naming. Keep max size of five chars.
  default_yaml_path = find_in_parent_folders("empty.yaml") # terragrunt function. read the file content for better explanation.
  enabled_api_services = [                                 # APIs enabled by default for all projects when created
    "compute.googleapis.com",
    "container.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "serviceusage.googleapis.com",
    "storage-api.googleapis.com",
    "servicenetworking.googleapis.com",
  ]

  gcp_billing_account    = "" # gcp billing account where projects will be created
  gcp_org_id             = ""         # gcp organization id where resources will be created
  gcp_seed_project_id    = "zeus-seed"               # initial seed project where terraform state bucket will be created
  region                 = "us-east1"              # default region for shared services
  stack                  = "global"                # architectural stack name
  inet_ranges = [                                  # range of IPs for internet access (NAT)
    "0.0.0.0/5",
    "8.0.0.0/7",
    "11.0.0.0/8",
    "12.0.0.0/6",
    "16.0.0.0/4",
    "32.0.0.0/3",
    "64.0.0.0/2",
    "128.0.0.0/3",
    "160.0.0.0/5",
    "168.0.0.0/6",
    "172.0.0.0/12",
    "172.32.0.0/11",
    "172.64.0.0/10",
    "172.128.0.0/9",
    "173.0.0.0/8",
    "174.0.0.0/7",
    "176.0.0.0/4",
    "192.0.0.0/9",
    "192.128.0.0/11",
    "192.160.0.0/13",
    "192.169.0.0/16",
    "192.170.0.0/15",
    "192.172.0.0/14",
    "192.176.0.0/12",
    "192.192.0.0/10",
    "193.0.0.0/8",
    "194.0.0.0/7",
    "196.0.0.0/6",
    "200.0.0.0/5",
    "208.0.0.0/4",
  ]
}

# Configure root level variables that all resources can inherit. This is especially helpful with multi-account configs
# where terraform_remote_state data sources are placed directly into the modules.
inputs = merge(
  # Configure Terragrunt to use common vars encoded as yaml to help you keep often-repeated variables (e.g., account ID)
  # DRY. We use yamldecode to merge the maps into the inputs, as opposed to using varfiles due to a restriction in
  # Terraform >=0.12 that all vars must be defined as variable blocks in modules. Terragrunt inputs are not affected by
  # this restriction.
  yamldecode(
    file("${find_in_parent_folders("region.yaml", local.default_yaml_path)}")
  ),
  yamldecode(
    file("${find_in_parent_folders("env.yaml", local.default_yaml_path)}")
  ),
  yamldecode(
    file("${find_in_parent_folders("service.yaml", local.default_yaml_path)}")
  ),
  yamldecode(
    file("${find_in_parent_folders("global.yaml", local.default_yaml_path)}")
  ),
  {
    billing_account : local.gcp_billing_account,
    company_id : local.company_id,
    org_id : local.gcp_org_id,
    region : local.region
  },
  {
    enabled_api_services : local.enabled_api_services
  },
  {
    inet_ranges : local.inet_ranges
  },
  {
    contact : local.contact
  }
)


# configure gcs bucket dynamically.
remote_state {
  backend = "gcs"
  config = {
    bucket               = format("%s-%s-terraform-state", local.company_id, local.stack)
    prefix               = path_relative_to_include()
    location             = "US"
    project              = local.gcp_seed_project_id
    skip_bucket_creation = false
  }
}