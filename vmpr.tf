resource "google_compute_instance" "vm2" {
  name         = var.vm2_name
  machine_type = var.machine_type
  zone         = var.zone

  labels = {
        env = var.env_vm2
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
