variable "subscription_id" {
  type = string
}

variable "location" {
  description = "Azure region for resources"
  type    = string
  default = "polandcentral"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "az104-rg8"
}

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
  default     = "localadmin"
}

variable "admin_password" {
  description = "Admin password for VMs"
  type        = string
  sensitive   = true
}

variable "vm_size" {
  description = "Size of the virtual machines"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "vm_image_publisher" {
  description = "VM image publisher"
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "vm_image_offer" {
  description = "VM image offer"
  type        = string
  default     = "WindowsServer"
}

variable "vm_image_sku" {
  description = "VM image SKU"
  type        = string
  default     = "2019-Datacenter"
}

variable "vm_image_version" {
  description = "VM image version"
  type        = string
  default     = "latest"
}

variable "vmss_instance_count" {
  description = "Initial instance count for VMSS"
  type        = number
  default     = 2
}

variable "vmss_min_instances" {
  description = "Minimum number of instances for autoscaling"
  type        = number
  default     = 2
}

variable "vmss_max_instances" {
  description = "Maximum number of instances for autoscaling"
  type        = number
  default     = 10
}

variable "vm_vnet_address_space" {
  description = "Address space for VM virtual network"
  type        = list(string)
  default     = ["10.81.0.0/20"]
}

variable "vm_subnet_address_prefix" {
  description = "Address prefix for VM subnet"
  type        = list(string)
  default     = ["10.81.0.0/24"]
}

variable "vmss_vnet_address_space" {
  description = "Address space for VMSS virtual network"
  type        = list(string)
  default     = ["10.82.0.0/20"]
}

variable "vmss_subnet_address_prefix" {
  description = "Address prefix for VMSS subnet"
  type        = list(string)
  default     = ["10.82.0.0/24"]
}
