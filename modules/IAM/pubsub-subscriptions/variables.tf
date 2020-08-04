variable "pubsub_subscription_project" {
    description = "project id for the pubsub subscription"
    type = string
}

variable "pubsub_subscription" {
    description = "name of the pubsub topic"
    type = string
}

variable "sa_email" {
    description = "service account email" 
    type = string
}