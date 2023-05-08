resource "google_compute_instance" "vm1" {
  name         = var.vm1_name
  machine_type = var.machine_type
  zone         = var.zone

  labels = {
        env = var.env_vm1
      }

  boot_disk {
    initialize_params {
      image = var.image
    
    }
  }

  network_interface {
    network = var.network

    access_config {
      // Ephemeral public IP
    }
  }
}
