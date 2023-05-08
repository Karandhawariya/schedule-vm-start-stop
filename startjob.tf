resource "google_cloud_scheduler_job" "job1" {
  name        = var.job1_name
  description = var.description_job1
  schedule    = var.schedule1
  time_zone = var.time_zone
  region = var.region

  pubsub_target {
    # topic.id is the topic's full resource name.
    topic_name = google_pubsub_topic.pub1.id
    data       = base64encode(var.data1)
  }
}
