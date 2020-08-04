include {
  path = find_in_parent_folders()
}


terraform {
  source = "../../../../modules/peeringnetwork"
}


dependency "folder" {
  config_path = "../../folder/"
  mock_outputs = {
    folder_id = "folders/939557470412"
  }
  mock_outputs_allowed_terraform_commands = ["plan", "validate", "destroy"]
}

dependency "network" {
    config_path = "../network/"
    mock_outputs = {
    network_name = "peepeepoopoo"
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


inputs = merge({
  private_ip_name : "redis-peering-network"
  peering_network: dependency.network.outputs.network_self_link
  project_id : dependency.host-project.outputs.project_id
})
