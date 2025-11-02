output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.aci_rg.name
}

output "resource_group_location" {
  description = "Location of the resource group"
  value       = azurerm_resource_group.aci_rg.location
}

output "container_name" {
  description = "Name of the container instance"
  value       = azurerm_container_group.aci.name
}

output "container_fqdn" {
  description = "FQDN of the container instance"
  value       = azurerm_container_group.aci.fqdn
}

output "container_ip_address" {
  description = "Public IP address of the container instance"
  value       = azurerm_container_group.aci.ip_address
}

output "container_url" {
  description = "URL to access the container application"
  value       = "http://${azurerm_container_group.aci.fqdn}"
}

output "container_id" {
  description = "ID of the container instance"
  value       = azurerm_container_group.aci.id
}