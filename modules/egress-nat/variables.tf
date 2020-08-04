variable "bgp_asn" {
  type = number
}

variable "name" {
  description = "The name to assign to the router resources"
  type        = string
}

variable "project_id" {
  description = "The ID of the Project to which the resources belong"
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network to attach the NAT resources"
  type        = string
}

variable "region" {
  description = "The region to construct the NAT resources in"
  type        = string
}

# note that this greatly reduces the flexibility of firewall rule configurations but
# likely suits our needs for the time being
variable "inet_ranges" {
  description = "The target CIDR ranges that are allowed to be accessed using IPV4 over any protocol via the egress NAT"
  type        = list(string)
}

variable "service_project_id" {
  description = "ID of the service project if this is a service project - only required if this is a service project, and only impacts the naming of Firewall rules"
  type        = string
  default     = ""
}

