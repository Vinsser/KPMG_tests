resource "google_compute_global_address" "app-glb-ip" {
  name = "app-glb-ip"
}

resource "google_compute_ssl_certificate" "app-cert" {
  name        = "app-global-10"
  certificate = "afdweqwewdasdasdasdasda"
  private_key = "afdweqwewdasdasdasdasda"

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_global_forwarding_rule" "external-app-lb" {
  name                  = "external-lb"
  target                = google_compute_target_https_proxy.app-proxy.id
  ip_address            = google_compute_global_address.app-glb-ip.id
  port_range            = "443"
  load_balancing_scheme = "EXTERNAL"
}

resource "google_compute_target_https_proxy" "app-proxy" {
  name             = "app-proxy"
  url_map          = google_compute_url_map.app-map.id
  ssl_certificates = [google_compute_ssl_certificate.app-cert.id]
}

resource "google_compute_url_map" "app-map" {
  name            = "app-map"
  description     = "mapping to app backend"
  default_service = google_compute_backend_service.app-backend.id
}


resource "google_compute_backend_service" "app-backend" {
  name                  = "app-backend"
  load_balancing_scheme = "EXTERNAL"
  protocol              = "HTTPS"
  port_name             = "http"

  backend {
    group = google_compute_instance_group_manager.app_group_manager.id
  }
}
