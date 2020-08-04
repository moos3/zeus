module "pubsub_topic_iam_binding" {
  source        = "github.com/terraform-google-modules/terraform-google-iam/modules/pubsub_topics_iam/"
  project       = var.pubsub_topic_project
  pubsub_topics = [var.pubsub_topic]
  mode          = "authoritative"

  bindings = {
    "roles/pubsub.publisher" = [
      "serviceAccount:${var.sa_email}",
    ]
    "roles/pubsub.viewer" = [
      "serviceAccount:${var.sa_email}",
    ]
  }
}
