output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.main.name
}

output "app_service_plan_id" {
  description = "ID of the App Service Plan"
  value       = azurerm_service_plan.main.id
}

output "webapp_name" {
  description = "Name of the Web App"
  value       = azurerm_linux_web_app.main.name
}

output "webapp_default_hostname" {
  description = "Default hostname of the production Web App"
  value       = azurerm_linux_web_app.main.default_hostname
}

output "webapp_production_url" {
  description = "Production Web App URL"
  value       = "https://${azurerm_linux_web_app.main.default_hostname}"
}

output "staging_slot_name" {
  description = "Name of the staging slot"
  value       = azurerm_linux_web_app_slot.staging.name
}

output "staging_slot_hostname" {
  description = "Default hostname of the staging slot"
  value       = azurerm_linux_web_app_slot.staging.default_hostname
}

output "staging_slot_url" {
  description = "Staging slot URL"
  value       = "https://${azurerm_linux_web_app_slot.staging.default_hostname}"
}

output "autoscale_setting_name" {
  description = "Name of the autoscale setting"
  value       = azurerm_monitor_autoscale_setting.main.name
}

output "autoscale_max_instances" {
  description = "Maximum number of instances configured for autoscaling"
  value       = var.autoscale_max_instances
}
