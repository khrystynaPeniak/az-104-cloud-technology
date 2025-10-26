output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.az104_rg7.name
}

output "storage_account_name" {
  description = "Name of the storage account"
  value       = azurerm_storage_account.storage.name
}

output "storage_account_primary_location" {
  description = "Primary location of the storage account"
  value       = azurerm_storage_account.storage.primary_location
}

output "storage_account_secondary_location" {
  description = "Secondary location of the storage account (GRS)"
  value       = azurerm_storage_account.storage.secondary_location
}

output "blob_container_name" {
  description = "Name of the blob container"
  value       = azurerm_storage_container.data.name
}

output "file_share_name" {
  description = "Name of the file share"
  value       = azurerm_storage_share.share1.name
}

output "virtual_network_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.vnet1.name
}

output "storage_account_primary_blob_endpoint" {
  description = "Primary blob endpoint URL"
  value       = azurerm_storage_account.storage.primary_blob_endpoint
}
