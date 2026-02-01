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
  project = var.Project
  region  = "us-central1"

}
# ======RESOURCE DEFINITIONS======
resource "google_storage_bucket" "terra_first_bucket" {

  # This name must be globally unqiue 
  name          = var.gcs_bucket_name
  location      = var.gcs_location
  storage_class = var.gcs_storage_class
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

resource "google_bigquery_dataset" "tera_bigquery_dataset" {
  dataset_id = var.big_query_dataset
  description = "This the the first BigQuery dataset created using Terraform"
  location   = "US"
  
}