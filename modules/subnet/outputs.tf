output "subnets" {
  value       = google_compute_subnetwork.subnetwork
  description = "The created subnet resources"
}

output "subnet_names" {
  value = [
    for index, subnet in google_compute_subnetwork.subnetwork :
      subnet.name
  ]
}

output "subnet_regions" {
  value = [
    for index, subnet in google_compute_subnetwork.subnetwork :
      subnet.region
  ]
  description = "list of subnet regions"
}

output "subnet_self_links" {
  value = [
    for index, subnet in google_compute_subnetwork.subnetwork :
      subnet.self_link
  ]
}