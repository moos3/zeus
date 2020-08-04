variable "project_id" {
    type = string
    description = "project id where you want project level permissions handled"
}


# since humans can have access to projects
variable "bindings" {
    type = map(list(string))
    description = "map of role <-> list(user) bindings"
}
