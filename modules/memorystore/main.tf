# reason for not using the module is connect_mode doesn't seem to work for it.
resource "google_redis_instance" "default" {
  project        = var.project_id
  name           = var.name
  tier           = var.tier
  memory_size_gb = var.memory_size_gb
  connect_mode   = var.connect_mode
  region                  = var.region
  location_id             = var.location_id
  alternative_location_id = var.alternative_location_id
  authorized_network = var.authorized_network
  redis_version     = var.redis_version
  display_name      = var.display_name
  reserved_ip_range = var.reserved_ip_range
  labels = var.labels
}