output "resource_group_name" {
  description = "Resource Group name"
  value       = azurerm_resource_group.main.name
}

output "vnet_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.main.id
}

output "public_ip_lb" {
  description = "Load Balancer Public IP"
  value       = azurerm_public_ip.lb.ip_address
}

output "public_ip_appgw" {
  description = "Application Gateway Public IP"
  value       = azurerm_public_ip.appgw.ip_address
}

output "vm0_name" {
  description = "VM0 Name"
  value       = azurerm_windows_virtual_machine.vm0.name
}

output "vm1_name" {
  description = "VM1 Name"
  value       = azurerm_windows_virtual_machine.vm1.name
}

output "vm2_name" {
  description = "VM2 Name"
  value       = azurerm_windows_virtual_machine.vm2.name
}
