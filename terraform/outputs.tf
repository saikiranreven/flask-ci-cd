output "cloud_run_url" {
  value = google_cloud_run_service.flask_app.status[0].url
}