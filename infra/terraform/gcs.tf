# resource "google_service_account" "object_viewer" {
#   account_id   = "object-viewer"
#   display_name = "Object viewer"
# }

# resource "google_service_account_key" "object_viewer_key" {
#   service_account_id = "${google_service_account.object_viewer.name}"
# }

# resource "google_project_iam_member" "data" {
#   role    = "roles/editor"
#   member  = "${google_service_account.object_viewer.email}"
# }



# # data "google_service_account_key" "object_viewer_key" {
# #   name = "${google_service_account_key.object_viewer_key.name}"
# #   public_key_type = "TYPE_X509_PEM_FILE"
# # }
# output "service_account" {
#     value = "${google_service_account.object_viewer.email}"
# }
