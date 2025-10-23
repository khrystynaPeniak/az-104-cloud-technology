resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "main" {
  name                = "az104-06-vnet1"
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "subnet0" {
  name                 = "subnet0"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.subnet0_address_prefix]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.subnet1_address_prefix]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.subnet2_address_prefix]
}

resource "azurerm_subnet" "appgw" {
  name                 = "subnet-appgw"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.subnet_appgw_address_prefix]
}

resource "azurerm_network_security_group" "main" {
  name                = var.nsg_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "Allow-RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-HTTP"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "nic0" {
  name                = "az104-06-nic0"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.subnet0.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "nic1" {
  name                = "az104-06-nic1"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "nic2" {
  name                = "az104-06-nic2"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.subnet2.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "nic0" {
  network_interface_id      = azurerm_network_interface.nic0.id
  network_security_group_id = azurerm_network_security_group.main.id
}

resource "azurerm_network_interface_security_group_association" "nic1" {
  network_interface_id      = azurerm_network_interface.nic1.id
  network_security_group_id = azurerm_network_security_group.main.id
}

resource "azurerm_network_interface_security_group_association" "nic2" {
  network_interface_id      = azurerm_network_interface.nic2.id
  network_security_group_id = azurerm_network_security_group.main.id
}

resource "azurerm_windows_virtual_machine" "vm0" {
  name                  = "az104-06-vm0"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  size                  = var.vm_size
  admin_username        = var.vm_admin_username
  admin_password        = var.vm_admin_password
  network_interface_ids = [azurerm_network_interface.nic0.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.vm_os_disk_storage_type
  }

  source_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = "latest"
  }
}

resource "azurerm_windows_virtual_machine" "vm1" {
  name                  = "az104-06-vm1"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  size                  = var.vm_size
  admin_username        = var.vm_admin_username
  admin_password        = var.vm_admin_password
  network_interface_ids = [azurerm_network_interface.nic1.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.vm_os_disk_storage_type
  }

  source_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = "latest"
  }
}

resource "azurerm_windows_virtual_machine" "vm2" {
  name                  = "az104-06-vm2"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  size                  = var.vm_size
  admin_username        = var.vm_admin_username
  admin_password        = var.vm_admin_password
  network_interface_ids = [azurerm_network_interface.nic2.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.vm_os_disk_storage_type
  }

  source_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = "latest"
  }
}

resource "azurerm_virtual_machine_extension" "vm0_iis" {
  name                 = "IIS"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm0.id
  publisher            = var.vm_extension_publisher
  type                 = var.vm_extension_type
  type_handler_version = "1.10"

  settings = <<SETTINGS
    {
      "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -Command \"Install-WindowsFeature -name Web-Server -IncludeManagementTools; if (Test-Path 'C:\\inetpub\\wwwroot\\iisstart.htm') { Remove-Item 'C:\\inetpub\\wwwroot\\iisstart.htm' -Force }; Add-Content -Path 'C:\\inetpub\\wwwroot\\iisstart.htm' -Value $('Hello World from ' + $env:computername)\""
    }
SETTINGS
}

resource "azurerm_virtual_machine_extension" "vm1_iis" {
  name                 = "IIS"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm1.id
  publisher            = var.vm_extension_publisher
  type                 = var.vm_extension_type
  type_handler_version = "1.10"

  settings = <<SETTINGS
    {
      "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -Command \"Install-WindowsFeature -name Web-Server -IncludeManagementTools; if (Test-Path 'C:\\inetpub\\wwwroot\\iisstart.htm') { Remove-Item 'C:\\inetpub\\wwwroot\\iisstart.htm' -Force }; Add-Content -Path 'C:\\inetpub\\wwwroot\\iisstart.htm' -Value $('Hello World from ' + $env:computername); New-Item -Path 'c:\\inetpub\\wwwroot' -Name 'image' -ItemType 'Directory' -Force; New-Item -Path 'c:\\inetpub\\wwwroot\\image\\' -Name 'iisstart.htm' -ItemType 'file' -Force; Add-Content -Path 'C:\\inetpub\\wwwroot\\image\\iisstart.htm' -Value $('Image from: ' + $env:computername)\""
    }
SETTINGS
}

resource "azurerm_virtual_machine_extension" "vm2_iis" {
  name                 = "IIS"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm2.id
  publisher            = var.vm_extension_publisher
  type                 = var.vm_extension_type
  type_handler_version = "1.10"

  settings = <<SETTINGS
    {
      "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -Command \"Install-WindowsFeature -name Web-Server -IncludeManagementTools; if (Test-Path 'C:\\inetpub\\wwwroot\\iisstart.htm') { Remove-Item 'C:\\inetpub\\wwwroot\\iisstart.htm' -Force }; Add-Content -Path 'C:\\inetpub\\wwwroot\\iisstart.htm' -Value $('Hello World from ' + $env:computername); New-Item -Path 'c:\\inetpub\\wwwroot' -Name 'video' -ItemType 'Directory' -Force; New-Item -Path 'c:\\inetpub\\wwwroot\\video\\' -Name 'iisstart.htm' -ItemType 'file' -Force; Add-Content -Path 'C:\\inetpub\\wwwroot\\video\\iisstart.htm' -Value $('Video from: ' + $env:computername)\""
    }
SETTINGS
}

resource "azurerm_public_ip" "lb" {
  name                = "az104-lb-pip"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
  sku                 = var.public_ip_sku
}

resource "azurerm_lb" "main" {
  name                = var.lb_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = var.lb_sku

  frontend_ip_configuration {
    name                 = "az104-fe"
    public_ip_address_id = azurerm_public_ip.lb.id
  }
}

resource "azurerm_lb_backend_address_pool" "main" {
  name            = "az104-lbpip"
  loadbalancer_id = azurerm_lb.main.id
}

resource "azurerm_network_interface_backend_address_pool_association" "vm0" {
  network_interface_id    = azurerm_network_interface.nic0.id
  ip_configuration_name   = "ipconfig"
  backend_address_pool_id = azurerm_lb_backend_address_pool.main.id
}

resource "azurerm_network_interface_backend_address_pool_association" "vm1" {
  network_interface_id    = azurerm_network_interface.nic1.id
  ip_configuration_name   = "ipconfig"
  backend_address_pool_id = azurerm_lb_backend_address_pool.main.id
}

resource "azurerm_lb_probe" "main" {
  name            = "az104-hp"
  loadbalancer_id = azurerm_lb.main.id
  protocol        = "Tcp"
  port            = 80
}

resource "azurerm_lb_rule" "main" {
  name                           = "az104-lbrule"
  loadbalancer_id                = azurerm_lb.main.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "az104-fe"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.main.id]
  probe_id                       = azurerm_lb_probe.main.id
}

resource "azurerm_public_ip" "appgw" {
  name                = "az104-appgw-pip"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
  sku                 = var.public_ip_sku
  zones               = var.appgw_zones
}

resource "azurerm_application_gateway" "main" {
  name                = "az104-appgw"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "appgw-ipcfg"
    subnet_id = azurerm_subnet.appgw.id
  }

  frontend_port {
    name = "appgw-frontend-port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "appgw-frontend-ipcfg"
    public_ip_address_id = azurerm_public_ip.appgw.id
  }

  backend_address_pool {
    name         = "appgw-default-backendpool"
    ip_addresses = [
      azurerm_network_interface.nic1.private_ip_address,
      azurerm_network_interface.nic2.private_ip_address
    ]
  }

  backend_address_pool {
    name         = var.appgw_image_backend_pool_name
    ip_addresses = [azurerm_network_interface.nic1.private_ip_address]
  }

  backend_address_pool {
    name         = var.appgw_video_backend_pool_name
    ip_addresses = [azurerm_network_interface.nic2.private_ip_address]
  }

  backend_http_settings {
    name                  = var.appgw_backend_http_settings_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 20
  }

  http_listener {
    name                           = "appgw-listener"
    frontend_ip_configuration_name = "appgw-frontend-ipcfg"
    frontend_port_name             = "appgw-frontend-port"
    protocol                       = "Http"
  }

  url_path_map {
    name                               = var.appgw_url_path_map_name
    default_backend_address_pool_name  = "appgw-default-backendpool"
    default_backend_http_settings_name = var.appgw_backend_http_settings_name

    path_rule {
      name                       = var.appgw_path_rule_image_name
      paths                      = var.appgw_path_rule_image_paths
      backend_address_pool_name  = var.appgw_image_backend_pool_name
      backend_http_settings_name = var.appgw_backend_http_settings_name
    }

    path_rule {
      name                       = var.appgw_path_rule_video_name
      paths                      = var.appgw_path_rule_video_paths
      backend_address_pool_name  = var.appgw_video_backend_pool_name
      backend_http_settings_name = var.appgw_backend_http_settings_name
    }
  }

  request_routing_rule {
    name               = "appgw-routing-rule"
    rule_type          = "PathBasedRouting"
    http_listener_name = "appgw-listener"
    url_path_map_name  = var.appgw_url_path_map_name
    priority           = 10
  }

  ssl_policy {
    policy_type = "Predefined"
    policy_name = "AppGwSslPolicy20220101"
  }
}