variable "host_project_id" {}

variable "subnets" {
  type = list(object(
    {
      name   = string
      region = string
      cidr   = string
    }
  ))
  default = []
}

variable "vpc_name" {}
