# Terragrunt will copy the terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your terraform command in that folder
terraform {
    source = "../../../modules/project"
}

# include all settings from the root terragrunt.hcl file
include {
    path = find_in_parent_folders()
}

dependency "folder" {
    config_path = "../folder"
    mock_outputs = {
        folder_id = "folders/1230123901"
    }
    mock_outputs_allowed_terraform_commands = ["plan", "validate", "destroy"]
}

dependency "host-project" {
    config_path = "../../global/shared-vpc/host-project"
    mock_outputs = {
        project_id = "shared-vpc-project"
    }
    mock_outputs_allowed_terraform_commands = ["plan", "validate", "destroy"]
}

inputs = merge({
    folder_id : dependency.folder.outputs.folder_id
    host_project_id : dependency.host-project.outputs.project_id
    project_id = "gcp-zeus-development"
    project_name = "development-env"
    team = "devops"
})