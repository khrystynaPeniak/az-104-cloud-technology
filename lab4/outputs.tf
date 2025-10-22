output "core_vnet_id" {
  value = azurerm_virtual_network.core_vnet.id
}

output "manufacturing_vnet_id" {
  value = azurerm_virtual_network.manufacturing_vnet.id
}

output "public_dns_zone_name" {
  value = azurerm_dns_zone.public_dns.name
}

output "private_dns_zone_name" {
  value = azurerm_private_dns_zone.private_dns.name
}

