variable "host_project_id" {
  type        = string
  description = "The ID of the shared VPC host project in which the resource belongs."
}

variable "network_self_link" {
  type        = string
  description = "The network this subnet belongs to. Only networks that are in the distributed mode can have subnetworks."
}

variable "project_id" {
  type        = string
  description = "The ID of the project in which the resource belongs."
}

variable "project_number" {
  type        = string
  description = "The ID of the project in which the resource belongs."
}


variable "region" {
  type        = string
  description = "GCP region for this subnetwork."
}

variable "subnets" {
  type        = list(map(string))
  description = "The list of subnets being created"
}

variable "secondary_ranges" {
  type        = map(list(object({ range_name = string, ip_cidr_range = string })))
  description = "Secondary ranges that will be used in some of the subnets"
  default     = {}
}

variable "host_project_number" {
  type = string
  description = "The ID of the host project in the resource belongs"
}