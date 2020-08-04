module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 2.1.1"

  project_id   = var.host_project_id
  network_name = format("%s-svpc-%s", var.host_project_id, var.vpc_name)

  shared_vpc_host = true

  subnets = [
    for subnet in var.subnets :
    {
      subnet_name   = format("%s-subnet-%s", var.vpc_name, subnet.name)
      subnet_region = subnet.region
      subnet_ip     = subnet.cidr
    }
  ]
}

