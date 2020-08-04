resource "google_folder" "folder" {
  display_name = var.folder_name != "" ? var.folder_name : var.environment
  parent       = format("organizations/%s", var.org_id)
}
