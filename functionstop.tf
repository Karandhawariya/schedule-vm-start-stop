resource "google_storage_bucket" "bucket2" {
  name     = var.bucket2_name
  location = var.location
}

resource "google_storage_bucket_object" "object2" {
  name   = var.object2_name
  bucket = google_storage_bucket.bucket2.name
  source = var.object2_source
}

resource "google_cloudfunctions_function" "function2" {
  name        = var.function2_name
  description = var.description
  runtime     = var.runtime
  region = var.region

  available_memory_mb   = 256
  source_archive_bucket = google_storage_bucket.bucket2.name
  source_archive_object = google_storage_bucket_object.object2.name
  event_trigger {
    event_type = var.event_type
    resource = google_pubsub_topic.pub2.name
  }         
  entry_point           =var.entry_point2
}

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "member2" {
  project        = google_cloudfunctions_function.function2.project
  region         = google_cloudfunctions_function.function2.region
  cloud_function = google_cloudfunctions_function.function2.name

  role   = var.role2
  member = var.member2
}

