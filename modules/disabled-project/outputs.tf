output "project_id" {
  value       = google_project.default.project_id
  description = "project_id of the project"
}

output "project" {
  value       = google_project.default
  description = "Full resource reference for the project"
}
