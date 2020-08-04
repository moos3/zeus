# terraform version to use
terraform {
  required_version = "~> 0.12"
}

# Cloud Router and NAT for public internet egress
# enable logging for troubleshooting and security
resource "google_compute_router" "default_egress_vpc_1" {
  project = var.project_id
  region  = var.region

  name        = var.name
  description = "Cloud Router for egress traffic."
  network     = var.network_name

  bgp {
    advertise_mode    = "DEFAULT"
    advertised_groups = []
    asn               = var.bgp_asn
  }
}

# create the NAT instance for functionality
resource "google_compute_router_nat" "default_egress_vpc_1" {
  project = var.project_id
  region  = var.region

  name   = var.name
  router = google_compute_router.default_egress_vpc_1.name

  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ALL"
  }
}

# firewall to permit egress access
# rule priority set high enough to not be overridden
resource "google_compute_firewall" "nat_egress_allow" {
  project = var.project_id

  name    = "${var.service_project_id != "" ? var.service_project_id : var.project_id}-any-nat-tcp-any-allow"
  network = var.network_name

  direction          = "EGRESS"
  priority           = 100
  destination_ranges = var.inet_ranges

  allow {
    protocol = "all"
  }
}


