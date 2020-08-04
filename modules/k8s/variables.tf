variable "project_id" {
  description = "The project ID to host the cluster in"
}

variable "cluster_name" {
  description = "The name for the GKE cluster"
  default     = "gke-on-vpc-cluster"
}

variable "region" {
  description = "The region to host the cluster in"
  default     = "us-central1"
}

variable "network" {
  description = "The VPC network created to host the cluster in"
  default     = "gke-network"
}
/*
variable "network_project_id" {
  type = string
  description = "for svpc you need to get the project id for the host project"
}
*/
variable "subnetwork" {
  description = "The subnetwork created to host the cluster in"
  default     = "gke-subnet"
}

variable "ip_range_pods_name" {
  description = "The secondary ip range to use for pods"
  default     = "ip-range-pods"
}

variable "ip_range_services_name" {
  description = "The secondary ip range to use for services"
  default     = "ip-range-scv"
}

variable "zones" {
  type = list
  description = "list of zones in a region"
  default = ["us-east1-b","us-east1-d", "us-east1-c"]
}

variable "http_load_balancing" {
  type = bool
  description = "enable http_load_balancing"
  default = true
}

variable "enable_horizontal_pod_autoscaling" {
  type = bool
  description = "enable enable_horizontal_pod_autoscaling"
  default = true
}

variable "enable_network_policy" {
  type = bool
  description = "enable network policies"
  default = true
}

variable "enable_private_endpoint" {
  type = bool
  description = "enable private endpoint"
  default = true
}

variable "enable_private_nodes" {
  type = bool
  description = "enable private nodes"
  default = true
}

variable "master_ipv4_cidr_block" {
  type = string
  description = "master ipv4 cidr block range"
  default = "10.0.0.0/28"
}

variable "istio_enable" {
  type = bool
  description = "enable istio on the cluster"
  default = false
}

variable "cloudrun_enable" {
  type = bool
  description = "enable cloudrun on the cluster"
  default = false
}

variable "dns_cache_enable" {
  type = bool
  description = "enable dns_cache on the cluster"
  default = false
}

variable "host_project_id" {
  type = string
  description = "host vpc project id"
}

variable "host_project_number" {
  type = string
  description = "host vpc project number"
}

variable "project_number" {
  type = string
  description = "shared vpc project number"
}