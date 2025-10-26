resource "azurerm_resource_group" "az104_rg7" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet_name
  location            = azurerm_resource_group.az104_rg7.location
  resource_group_name = azurerm_resource_group.az104_rg7.name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "default" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.az104_rg7.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = var.subnet_address_prefixes
  service_endpoints    = ["Microsoft.Storage"]
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.az104_rg7.name
  location                 = azurerm_resource_group.az104_rg7.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  min_tls_version          = "TLS1_2"
  

  blob_properties {
    versioning_enabled = false
    
    delete_retention_policy {
      days = var.soft_delete_retention_days
    }
  }

  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = [azurerm_subnet.default.id]
    ip_rules                   = [var.client_ip_address]
  }

  tags = {
    Environment = "Lab"
    Purpose     = "AZ-104 Training"
  }
}

resource "azurerm_storage_container" "data" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}

resource "azurerm_storage_container_immutability_policy" "data_policy" {
  storage_container_resource_manager_id = azurerm_storage_container.data.id
  immutability_period_in_days           = var.immutability_period_days
  protected_append_writes_enabled       = true
  locked                                = false
}

resource "azurerm_storage_management_policy" "movetocool" {
  storage_account_id = azurerm_storage_account.storage.id

  rule {
    name    = "Movetocool"
    enabled = true
    
    filters {
      blob_types   = ["blockBlob"]
      prefix_match = ["${var.container_name}/"]
    }
    
    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than = var.lifecycle_cool_days
      }
    }
  }
}

resource "azurerm_storage_share" "share1" {
  name                 = var.file_share_name
  storage_account_id   = azurerm_storage_account.storage.id
  quota                = var.file_share_quota
  access_tier          = "TransactionOptimized"
}