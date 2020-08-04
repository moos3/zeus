module "storage_buckets_iam_binding" {
  source = "github.com/terraform-google-modules/terraform-google-iam/modules/storage_buckets_iam/" 
  storage_buckets = [var.storage_bucket]
  mode            = "authoritative"
  bindings =    var.bindings
}
