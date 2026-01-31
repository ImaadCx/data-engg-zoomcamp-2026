# ======TERRAFORM BLOCK======
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

# ======PROVIDER CONFIG======
provider "google" {
  project = "terraform-dezoom-2026"
  region  = "us-central1"

}
# ======RESOURCE DEFINITIONS======
resource "google_storage_bucket" "terra_first_bucket" {

  # This name must be globally unqiue 
  name          = "terra-first-bucket-dezoom-2616"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }
  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}
 