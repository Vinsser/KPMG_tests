resource "google_compute_network" "vpc_network" {
  project                 = var.project_name
  name                    = var.vpc_main
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "compute_sub" {
  name          = "compute-network"
  ip_cidr_range = "10.2.1.0/24"
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_global_address" "private_ip_address" {

  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 24
  network       = google_compute_network.vpc_network.id
}

resource "google_service_networking_connection" "private_vpc_connection" {

  network                 = google_compute_network.vpc_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}