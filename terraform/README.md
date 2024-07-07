# Vertexai_terra
Deploy Vertex Ai Endpoint Network Terraform

# Vertex AI and VPC Network Configuration

This project sets up a Google Cloud Vertex AI environment along with the necessary VPC networking. The configuration enables the Vertex AI API, creates a VPC network, establishes a peering connection, and creates a Vertex AI endpoint.

## Resources

- **google_project**: Retrieves information about the Google Cloud project.
- **google_project_service**: Enables the Vertex AI API.
- **google_compute_network**: Creates a VPC network.
- **google_service_networking_connection**: Establishes a peering connection between the VPC network and Google's service networking.
- **google_compute_global_address**: Reserves a global address for VPC peering.
- **google_vertex_ai_endpoint**: Creates a Vertex AI endpoint.

## Prerequisites

Ensure you have the following before you begin:
- A Google Cloud project.
- Terraform installed on your local machine.
- Properly authenticated with Google Cloud (e.g., using `gcloud auth application-default login`).

## Usage

1. **Clone the repository**:

   ```sh
   git clone <repository-url>
   cd <repository-directory>
