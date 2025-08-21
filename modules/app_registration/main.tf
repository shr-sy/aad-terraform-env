variable "display_name" { type = string }

resource "azuread_application" "app" {
  display_name = var.display_name
}

resource "azuread_service_principal" "sp" {
  application_id = azuread_application.app.application_id
}

output "app_id" {
  value = azuread_application.app.application_id
}

output "sp_object_id" {
  value = azuread_service_principal.sp.id
}
