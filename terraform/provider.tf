provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_cloud_run_service" "flask_app" {
  name     = "flask-app"
  location = var.region

  template {
    spec {
      containers {
        image = var.image_url
      }
    }
  }

  traffics {
    percent         = 100
    latest_revision = true
  }
}

resource "google_project_iam_member" "public_invoker" {
  project = var.project_id
  role    = "roles/run.invoker"
  member  = "allUsers"
}
