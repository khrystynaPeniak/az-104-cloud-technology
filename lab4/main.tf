resource "azurerm_resource_group" "lab_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "core_vnet" {
  name                = var.core_vnet_name
  address_space       = var.core_vnet_address_space
  location            = var.location
  resource_group_name = azurerm_resource_group.lab_rg.name
}

resource "azurerm_subnet" "core_subnets" {
  for_each            = { for s in var.core_subnets : s.name => s }
  name                 = each.value.name
  resource_group_name  = azurerm_resource_group.lab_rg.name
  virtual_network_name = azurerm_virtual_network.core_vnet.name
  address_prefixes     = [each.value.address_prefix]
}

resource "azurerm_virtual_network" "manufacturing_vnet" {
  name                = var.manufacturing_vnet_name
  address_space       = var.manufacturing_vnet_address_space
  location            = var.location
  resource_group_name = azurerm_resource_group.lab_rg.name
}

resource "azurerm_subnet" "manufacturing_subnets" {
  for_each            = { for s in var.manufacturing_subnets : s.name => s }
  name                 = each.value.name
  resource_group_name  = azurerm_resource_group.lab_rg.name
  virtual_network_name = azurerm_virtual_network.manufacturing_vnet.name
  address_prefixes     = [each.value.address_prefix]
}

resource "azurerm_application_security_group" "asg_web" {
  name                = var.asg_name
  resource_group_name = azurerm_resource_group.lab_rg.name
  location            = var.location
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = azurerm_resource_group.lab_rg.name
}

resource "azurerm_network_security_rule" "allow_asg" {
  name                                       = "AllowASG"
  priority                                   = 100
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "Tcp"
  source_port_range                          = "*"
  destination_port_ranges                    = ["80", "443"]
  source_application_security_group_ids      = [azurerm_application_security_group.asg_web.id]
  destination_address_prefix                 = "*"
  resource_group_name                        = azurerm_resource_group.lab_rg.name
  network_security_group_name                = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "deny_internet_outbound" {
  name                        = "DenyInternetOutbound"
  priority                    = 4096
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_address_prefix       = "*"
  source_port_range           = "*"
  destination_address_prefix  = "Internet"
  destination_port_range      = "*"
  resource_group_name         = azurerm_resource_group.lab_rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_subnet_network_security_group_association" "shared_services_nsg_association" {
  subnet_id                 = azurerm_subnet.core_subnets["SharedServicesSubnet"].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_dns_zone" "public_dns" {
  name                = var.public_dns_zone_name
  resource_group_name = azurerm_resource_group.lab_rg.name
}

resource "azurerm_private_dns_zone" "private_dns" {
  name                = var.private_dns_zone_name
  resource_group_name = azurerm_resource_group.lab_rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "manufacturing_link" {
  name                  = "manufacturing-link"
  resource_group_name   = azurerm_resource_group.lab_rg.name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns.name
  virtual_network_id    = azurerm_virtual_network.manufacturing_vnet.id
  registration_enabled  = false
}

resource "azurerm_dns_a_record" "www" {
  name                = "www"
  zone_name           = azurerm_dns_zone.public_dns.name
  resource_group_name = azurerm_resource_group.lab_rg.name
  ttl                 = 1
  records             = [var.public_dns_a_record_ip]
}

resource "azurerm_private_dns_a_record" "sensorvm" {
  name                = "sensorvm"
  zone_name           = azurerm_private_dns_zone.private_dns.name
  resource_group_name = azurerm_resource_group.lab_rg.name
  ttl                 = 1
  records             = [var.private_dns_a_record_ip]
}
