# Terragrunt will copy the terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your terraform command in that folder
terraform {
    source = "../../../modules/k8s"
}

# include all settings from the root terragrunt.hcl file
include {
    path = find_in_parent_folders()
}

# hack to deal with the current K8S issue
dependency "test-service-account" {
    config_path = "../service-accounts/test-service-account"
    skip_outputs = true
}

# hack to deal with the current K8S issue
dependency "mysql-cluster" {
    config_path = "../mysql"
    skip_outputs = true 
}

dependency "folder" {
    config_path = "../folder"
    mock_outputs = {
        folder_id = "folders/1230123901"
    }
    mock_outputs_allowed_terraform_commands = ["plan", "validate", "destroy"]
}

dependency "project" {
    config_path = "../project"
    mock_outputs = {
        project_id = "service-vpc-project"
        project_name = "service-vpc-project"
        project_number = "123901230912312"
    }
    mock_outputs_allowed_terraform_commands = ["plan", "validate", "destroy"]
}

dependency "host-project" {
    config_path = "../../global/shared-vpc/host-project"
    mock_outputs = {
        project_id = "service-vpc-project"
    }
    mock_outputs_allowed_terraform_commands = ["plan", "validate", "destroy"]
}

dependency "svpc" {
    config_path = "../../global/shared-vpc/network"
    mock_outputs = {
        project_id = "my-network"
    }
    mock_outputs_allowed_terraform_commands = ["plan", "validate", "destroy"]
}

dependency "project-stack" {
    config_path = "../project-stack"
    mock_outputs = {
        sa_mbot_bucket_creator = {
            "account_id" = "sa-mbot-bucket-creator"
            "description" = ""
            "display_name" = "Bucket DNS Naming Delegate for awesome.sauce"
            "email" = "sa-mbot-bucket-creator@myawesomepoject.iam.gserviceaccount.com"
            "id" = "projects/mb-development-env-c69e/serviceAccounts/sa-mbot-bucket-creator@myawesomepoject.iam.gserviceaccount.com"
            "name" = "projects/mb-development-env-c69e/serviceAccounts/sa-mbot-bucket-creator@myawesomepoject.iam.gserviceaccount.com"
            "project" = "myawesomepoject"
            "unique_id" = "1036514984a654fds6843"
        }
        subnet_names = [
            "asia-east2-dev",
            "europe-west6-dev",
        ]
        subnet_network_self_link = [
            "https://www.googleapis.com/compute/v1/projects/svpc-host-04c2/regions/asia-east2/subnetworks/asia-east2-dev",
            "https://www.googleapis.com/compute/v1/projects/svpc-host-04c2/regions/europe-west6/subnetworks/europe-west6-dev",
        ]
        subnet_regions = [
            "asia-east2",
            "europe-west6",
        ]
    }
    mock_outputs_allowed_terraform_commands = ["plan", "validate", "destroy"]
}


## These could be moved to the env.yml if you wanted too
# commend using this module https://github.com/gruntwork-io/terraform-google-gke/blob/master/examples/gke-private-cluster/main.tf
inputs = merge({
    host_project_id : dependency.host-project.outputs.project_id
    host_project_number : dependency.host-project.outputs.project_number
    network : dependency.svpc.outputs.network_name
    subnetwork : dependency.project-stack.outputs.subnet_names[3]
    project_id : dependency.project.outputs.project_id 
    project_number : dependency.project.outputs.project_number
    ip_range_pod_name = "dev-pods-ips"
    ip_range_services_name = "dev-services-ips"
    cluster_name = "billys-dev-cluster"
    region = "us-east1"
    enable_private_endpoint = false
    enable_private_nodes = true
    istio = true
    master_ipv4_cidr_block = "10.64.1.0/28"
})