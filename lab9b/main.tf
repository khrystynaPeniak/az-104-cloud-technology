resource "azurerm_resource_group" "aci_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_container_group" "aci" {
  name                = var.container_name
  location            = azurerm_resource_group.aci_rg.location
  resource_group_name = azurerm_resource_group.aci_rg.name
  ip_address_type     = "Public"
  dns_name_label      = var.dns_name_label
  os_type             = "Linux"
  restart_policy      = "Always"

  container {
    name   = var.container_name
    image  = var.container_image
    cpu    = var.cpu_cores
    memory = var.memory_in_gb

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}