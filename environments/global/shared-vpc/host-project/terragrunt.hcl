# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "../../../../modules/project"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

dependency "folder" {
  config_path = "../../folder"
  mock_outputs = {
    folder_id = "folders/939557470412"
  }
  mock_outputs_allowed_terraform_commands = ["plan", "validate", "destroy"]
}

inputs = {
  folder_id         = dependency.folder.outputs.folder_id
  host_project_id   = "svpc-host"
  random_project_id = true
}
