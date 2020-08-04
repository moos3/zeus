module "pubsub_subscription_iam_binding" {
  source = "github.com/terraform-google-modules/terraform-google-iam/modules/pubsub_subscriptions_iam/"  
  project              = var.pubsub_subscription_project
  pubsub_subscriptions = [var.pubsub_subscription]
  mode                 = "authoritive"
  bindings = {
    "roles/pubsub.viewer" = [
      "serviceAccount:${var.sa_email}",
    ]
    "roles/pubsub.editor" = [
      "serviceAccount:${var.sa_email}",
    ]
  }
}
