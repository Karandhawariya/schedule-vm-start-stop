resource "google_storage_bucket" "bucket1" {
  name     = var.bucket1_name
  location = var.location
}

resource "google_storage_bucket_object" "object1" {
  name   = var.object1_name
  bucket = google_storage_bucket.bucket1.name
  source = var.object1_source
}

resource "google_cloudfunctions_function" "function" {
  name        = var.function_name
  description = var.description
  runtime     = var.runtime
  region = var.region

  available_memory_mb   = 256
  source_archive_bucket = google_storage_bucket.bucket1.name
  source_archive_object = google_storage_bucket_object.object1.name
  event_trigger {
    event_type = var.event_type
    resource = google_pubsub_topic.pub1.name
  }         
  entry_point           =var.entry_point1
}

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "member1" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = var.role1
  member = var.member1
}

