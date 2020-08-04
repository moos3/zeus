# Terragrunt will copy the terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your terraform command in that folder
terraform {
    source = "../../../modules/folder"
}

# include all settings from the root terragrunt.hcl file
include {
    path = find_in_parent_folders()
}

inputs = merge({
  folder_name : "dev"
})