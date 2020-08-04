# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "../../../../modules/svpc"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

dependency "folder" {
  config_path = "../../folder/"
  mock_outputs = {
    folder_id = "folders/939557470412"
  }
  mock_outputs_allowed_terraform_commands = ["plan", "validate", "destroy"]
}

dependency "host-project" {
  config_path = "../host-project"
  mock_outputs = {
    project_id = "carvalho-mb-host-vpc"
  }
  mock_outputs_allowed_terraform_commands = ["plan", "validate", "destroy"]
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = merge({
  host_project_id : dependency.host-project.outputs.project_id,
  vpc_name : "main",
})

