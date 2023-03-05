##########################################################################################

resource "google_compute_instance_template" "app_instance_01" {
  name        = "app-template"
  description = "This template is used to create app server instances."

  tags = ["app"]

  labels = {
    environment = "dev"
  }

  instance_description = "description assigned to instances"
  machine_type         = "e2-medium"
  can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  // Create a new boot disk from an image
  disk {
    source_image = "debian-cloud/debian-11"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network    = var.vpc_main
    subnetwork = "compute-network"
  }

  metadata = {
    foo = "bar"
  }
}


resource "google_compute_instance_group_manager" "app_group_manager" {
  name               = "app-group-manager"
  base_instance_name = "app-server"
  zone               = "${var.region}-a"
  target_size        = "2"
  version {
    instance_template = google_compute_instance_template.app_instance_01.id
  }
  named_port {
    name = "http"
    port = 8080
  }
}