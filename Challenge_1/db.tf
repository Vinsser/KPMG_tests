resource "google_sql_database" "database" {
  name     = "db-01"
  instance = google_sql_database_instance.instance.name
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "instance" {
  name             = "d-instance-01"
  region           = var.region
  database_version = "MYSQL_8_0"
  depends_on       = [google_service_networking_connection.private_vpc_connection]


  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.vpc_network.id
    }
  }

}