output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.main.name
}

output "resource_group_location" {
  description = "Location of the resource group"
  value       = azurerm_resource_group.main.location
}

output "vm1_id" {
  description = "ID of Virtual Machine 1"
  value       = azurerm_windows_virtual_machine.vm1.id
}

output "vm1_name" {
  description = "Name of Virtual Machine 1"
  value       = azurerm_windows_virtual_machine.vm1.name
}

output "vm1_private_ip" {
  description = "Private IP address of VM1"
  value       = azurerm_network_interface.vm1_nic.private_ip_address
}

output "vm1_zone" {
  description = "Availability zone of VM1"
  value       = azurerm_windows_virtual_machine.vm1.zone
}

output "vm2_id" {
  description = "ID of Virtual Machine 2"
  value       = azurerm_windows_virtual_machine.vm2.id
}

output "vm2_name" {
  description = "Name of Virtual Machine 2"
  value       = azurerm_windows_virtual_machine.vm2.name
}

output "vm2_private_ip" {
  description = "Private IP address of VM2"
  value       = azurerm_network_interface.vm2_nic.private_ip_address
}

output "vm2_zone" {
  description = "Availability zone of VM2"
  value       = azurerm_windows_virtual_machine.vm2.zone
}

output "vm1_data_disk_id" {
  description = "ID of VM1 data disk"
  value       = azurerm_managed_disk.vm1_data_disk.id
}

output "vm1_data_disk_name" {
  description = "Name of VM1 data disk"
  value       = azurerm_managed_disk.vm1_data_disk.name
}

output "vmss_id" {
  description = "ID of the Virtual Machine Scale Set"
  value       = azurerm_windows_virtual_machine_scale_set.vmss.id
}

output "vmss_name" {
  description = "Name of the Virtual Machine Scale Set"
  value       = azurerm_windows_virtual_machine_scale_set.vmss.name
}

output "vmss_unique_id" {
  description = "Unique ID of the Virtual Machine Scale Set"
  value       = azurerm_windows_virtual_machine_scale_set.vmss.unique_id
}

output "vmss_load_balancer_public_ip" {
  description = "Public IP address of the VMSS Load Balancer"
  value       = azurerm_public_ip.vmss_lb_pip.ip_address
}

output "vmss_load_balancer_fqdn" {
  description = "FQDN of the VMSS Load Balancer"
  value       = azurerm_public_ip.vmss_lb_pip.fqdn
}

output "autoscale_setting_id" {
  description = "ID of the autoscale setting"
  value       = azurerm_monitor_autoscale_setting.vmss_autoscale.id
}

output "vm_vnet_id" {
  description = "ID of the VM Virtual Network"
  value       = azurerm_virtual_network.vm_vnet.id
}

output "vmss_vnet_id" {
  description = "ID of the VMSS Virtual Network"
  value       = azurerm_virtual_network.vmss_vnet.id
}