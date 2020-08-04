# since humans can have access to buckets we can 
variable "bindings" {
    type = map(list(string))
    description = "map of role <-> list(user) bindings"
}

variable "storage_bucket" {
    type = string
    description = "name of the bucket"
}