resource "google_compute_global_address" "private_ip_alloc" {
  project       = var.project_id
  name          = var.private_ip_name
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = var.prefix_length
  network       = var.peering_network
}


resource "google_service_networking_connection" "peering_network_connection" {
  network                 = var.peering_network
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_alloc.name]
}