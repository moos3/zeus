module "mysql-cluster" {
  source                    = "github.com/terraform-google-modules/terraform-google-sql-db/modules/mysql"
  activation_policy         = var.activation_policy
  database_version          = var.database_version
  name                      = var.database_name
  project_id                = var.project_id
  read_replica_name_suffix  = "read-replica"
  region                    = var.database_region
  # just gonna throw master in A cause it works
  zone                      = "b"
  ip_configuration = {
    ipv4_enabled    = false
    require_ssl     = false
    private_network = var.authorized_network
    authorized_networks = [{
      value = "0.0.0.0/0"
    }]
  }
}