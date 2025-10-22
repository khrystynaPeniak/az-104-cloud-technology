output "resource_group_name" {
  description = "Resource group name"
  value       = azurerm_resource_group.rg.name
}

output "core_vnet_id" {
  description = "Core Services VNet ID"
  value       = azurerm_virtual_network.core_vnet.id
}

output "manufacturing_vnet_id" {
  description = "Manufacturing VNet ID"
  value       = azurerm_virtual_network.manufacturing_vnet.id
}

output "core_vm_private_ip" {
  description = "Core Services VM private IP address"
  value       = azurerm_network_interface.core_nic.private_ip_address
}

output "manufacturing_vm_private_ip" {
  description = "Manufacturing VM private IP address"
  value       = azurerm_network_interface.manufacturing_nic.private_ip_address
}

output "peering_status_core_to_manufacturing" {
  description = "Peering status from Core to Manufacturing"
  value       = azurerm_virtual_network_peering.core_to_manufacturing.name
}

output "peering_status_manufacturing_to_core" {
  description = "Peering status from Manufacturing to Core"
  value       = azurerm_virtual_network_peering.manufacturing_to_core.name
}

output "route_table_name" {
  description = "Route table name"
  value       = azurerm_route_table.rt_core_services.name
}

