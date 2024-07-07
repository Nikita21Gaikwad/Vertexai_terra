#read project info
data "google_project" "project" {}


# [START aiplatform_enable_vertex_ai_api]
# Enable Vertex AI API
resource "google_project_service" "default" {
  service            = "aiplatform.googleapis.com"
  disable_on_destroy = false
}
# [END aiplatform_enable_vertex_ai_api]


# [START google_compute_network]
#create Vpc network
resource "google_compute_network" "vertex_network" {
  name       = var.Vpc_network_name
}
# [END google_compute_network]


# [START google_service_networking_connection]
#create google_service_networking_connection
resource "google_service_networking_connection" "vertex_vpc_connection" {
  network                 = google_compute_network.vertex_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.vertex_range.name]
}
# [END google_service_networking_connection]

# [START google_compute_global_address]
resource "google_compute_global_address" "vertex_range" {
  name          = "address-name"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 24
  network       = google_compute_network.vertex_network.id
}
# [END google_compute_global_address]


# [START google_vertex_ai_endpoint]
resource "google_vertex_ai_endpoint" "endpoint" {
  name         = var.endpoint_name
  display_name = var.endpoint_name
  description  = "A sample vertex endpoint"
  location     = var.location
  region       = var.region
  labels       = {
    label-one = "value-one"
  }
  network      = "projects/${data.google_project.project.number}/global/networks/${google_compute_network.vertex_network.name}"

  depends_on   = [
    google_service_networking_connection.vertex_vpc_connection
  ]
}
# [END google_vertex_ai_endpoint]






