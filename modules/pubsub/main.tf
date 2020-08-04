module "pubsub" {
  source  = "terraform-google-modules/pubsub/google"
  version = "~> 0.2.0"

  topic              = var.pubsub_topic_name
  project_id         = var.project_id
  # TODO: Figure out how to deal with this via terragrunt
  push_subscriptions = var.push_subscriptions
  pull_subscriptions = var.pull_subscriptions
}