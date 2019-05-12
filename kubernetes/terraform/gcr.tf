data "google_container_registry_repository" "mdcloud" {}

output "gcr_location" {
    value = "${data.google_container_registry_repository.mdcloud.repository_url}"
}

