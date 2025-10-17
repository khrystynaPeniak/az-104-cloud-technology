output "resource_group_name" {
  value = azurerm_resource_group.rgroup.name
}

output "managed_disks" {
  value = [for d in azurerm_managed_disk.disk : d.name]
}
