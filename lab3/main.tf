resource "azurerm_resource_group" "rgroup" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_managed_disk" "disk" {
  count                = var.disk_count
  name                 = "${var.disk_name_prefix}${count.index + 1}"
  location             = azurerm_resource_group.rgroup.location
  resource_group_name  = azurerm_resource_group.rgroup.name
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
}
