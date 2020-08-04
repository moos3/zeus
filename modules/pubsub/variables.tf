variable "pubsub_topic_name" {
    type = string
    description = "name of the topic"
}


variable "push_subscriptions" {
    type = list(map(string))
    description = "a list of push subscriptions and their options"
}

variable "pull_subscriptions" {
    type = list(map(string))
    description = "a list of pull subscriptions and their options"
}