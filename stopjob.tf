resource "google_cloud_scheduler_job" "job2" {
  name        = var.job2_name
  description = var.description_job2
  schedule    = var.schedule2
  time_zone = var.time_zone
  region = var.region

  pubsub_target {
    # topic.id is the topic's full resource name.
    topic_name = google_pubsub_topic.pub2.id
    data       = base64encode(var.data2)
  }
}
