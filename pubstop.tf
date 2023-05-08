resource "google_pubsub_topic" "pub2" {
  name = var.pub2_name
  message_retention_duration = var.retention
}
