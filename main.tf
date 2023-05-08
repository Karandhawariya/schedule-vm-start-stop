module "startstop" {
    source = "../modulee/cf-start-stop-scheduler"
     bucket1_name = "kdempire"
    bucket2_name = "kdempire1"
    location = "US"
    region = "us-central1"
    zone = "us-central1-a"
    object1_name = "index.zip"
    object2_name = "index1.zip"
    object1_source = "index.zip"
    object2_source = "index1.zip"
    function_name = "start-vm"
    function2_name = "stop-vm"
    description = "start-stop-function"
    runtime = "nodejs10"
    event_type = "google.pubsub.topic.publish"
    entry_point1 = "start"
    entry_point2 = "stop"
    role1 = "roles/viewer"
    member1 = "allUsers"
    role2 = "roles/viewer"
    member2 = "allUsers"
    pub1_name = "startpub"
    pub2_name = "stoppub"
    retention = "86600s"
    job1_name = "start-job"
    job2_name ="stop-job"
    time_zone = "Asia/Calcutta"
    schedule1 = "*/2 * * * *"
    schedule2 = "*/5 * * * *"
    data1 = "{\"zone\":\"us-central1-a\",\"label\":\"env=dev\"}"
    data2 = "{\"zone\":\"us-central1-a\",\"label\":\"env=dev\"}"
    description_job1 = "start-job"
    description_job2 = "stop-job"
    vm1_name = "server1"
    vm2_name = "server2"
    env_vm1 = "dev"
    env_vm2 = "pr"
    machine_type = "e2-micro"
    image = "debian-cloud/debian-11"
    network = "default"
}













