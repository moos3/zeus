module "project_iam_binding" {
  source   = "github.com/terraform-google-modules/terraform-google-iam/modules/projects_iam/"
  projects = [var.project_id]
  # Additive because we don't wanna mess anything up currently, we can probably fix this later
  mode     = "additive"
  bindings =    var.bindings
}