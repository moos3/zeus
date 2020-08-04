# Terragrunt will copy the terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your terraform command in that folder
terraform {
    source = "../../../../modules/service-accounts"
}

# include all settings from the root terragrunt.hcl file
include {
    path = find_in_parent_folders()
}



dependency "folder" {
    config_path = "../../folder"
    mock_outputs = {
        folder_id = "folders/1230123901"
    }
    mock_outputs_allowed_terraform_commands = ["plan", "validate", "destroy"]
}


dependency "project" {
    config_path = "../../project"
    mock_outputs = {
        project_id = "service-vpc-project"
        project_name = "service-vpc-project"
        project_number = "123901230912312"
    }
    mock_outputs_allowed_terraform_commands = ["plan", "validate", "destroy"]
}

dependency "host-project" {
    config_path = "../../../global/shared-vpc/host-project"
    mock_outputs = {
        project_id = "service-vpc-project"
    }
    mock_outputs_allowed_terraform_commands = ["plan", "validate", "destroy"]
}

dependency "svpc" {
    config_path = "../../../global/shared-vpc/network"
    mock_outputs = {
        project_id = "my-network"
    }
    mock_outputs_allowed_terraform_commands = ["plan", "validate", "destroy"]
}

inputs = {
    project_id : dependency.project.outputs.project_id
    service_account_project_id = dependency.project.outputs.project_id
    service_account_name = "test-service-account"
    service_account_display_name = "Test Service Account"
    service_account_description = "Does test stuff"    
}