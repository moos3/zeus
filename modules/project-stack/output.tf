output "sa_mbot_bucket_creator" {
  value = module.sa-mbot-bucket-creator.service_account
}

output "subnet_names" {
  value = module.subnet_private_1.subnet_names
}

output "subnet_regions" {
  value = module.subnet_private_1.subnet_regions
}

output "subnet_network_self_link" {
  value = module.subnet_private_1.subnet_self_links
}