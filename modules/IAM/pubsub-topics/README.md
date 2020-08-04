# IAM/pubsub-topics

## Notes
As a best practice and in keeping with laws of causality, you should have the pubsub topic and the service account created before trying to create an IAM binding. Make sure your terragrunt.hcl for this has these:

```
dependency "pubsub-topic" {
    config_path = "../path/to/dependent/pubsub-topic"
    mock_outputs = {
        project_id = "service-vpc-project"
        topic_name = "pubsub-topic-name"
    }
    mock_outputs_allowed_terraform_commands = ["plan", "validate", "destroy"]
}

dependency "pubsub-topic-service-account" {
    config_path = "../path/to/dependent/pubsub/account"
    mock_outputs = {
        project_id  = "service-vpc-project"
        topic_name  = "pubsub-topic-name"
        sa_email    = "foo@bar.co.uk"
    }
    mock_outputs_allowed_terraform_commands = ["plan", "validate", "destroy"]
}
```