variable "Project" {
  description = "Project"
  default = "terraform-dezoom-2026"
}
variable "big_query_dataset" {
  description = "Bigquery dataset name "
  default = "demo_dataset"
}

variable "gcs_bucket_name"{
    description = "GCS bucket name "
    default = "demo_bucket"
}

variable "gcs_storage_class" {
    description = "GCS storage class"
    default = "STANDARD"
}
variable "gcs_location" {
    description = "GCS location"
    default = "US"
}
