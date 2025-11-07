output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.rg.name
}

output "container_app_name" {
  description = "Name of the container app"
  value       = azurerm_container_app.app.name
}

output "container_app_fqdn" {
  description = "FQDN of the container app"
  value       = azurerm_container_app.app.latest_revision_fqdn
}

output "container_app_url" {
  description = "URL of the container app (use this to access the application)"
  value       = "https://${azurerm_container_app.app.latest_revision_fqdn}"
}

output "container_app_environment_name" {
  description = "Name of the container app environment"
  value       = azurerm_container_app_environment.env.name
}