resource "google_pubsub_topic" "pub1" {
  name = var.pub1_name
  message_retention_duration = var.retention
}
