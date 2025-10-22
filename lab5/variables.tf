variable "subscription_id" {
  type = string
}

variable "location" {
  type    = string
  default = "polandcentral"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "az104-rg5"
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

variable "core_vnet_name" {
  description = "Name of core services virtual network"
  type        = string
  default     = "CoreServicesVnet"
}

variable "core_vnet_address_space" {
  description = "Address space for core services VNet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "core_subnet_name" {
  description = "Name of core subnet"
  type        = string
  default     = "Core"
}

variable "core_subnet_prefix" {
  description = "Address prefix for core subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "perimeter_subnet_name" {
  description = "Name of perimeter subnet"
  type        = string
  default     = "perimeter"
}

variable "perimeter_subnet_prefix" {
  description = "Address prefix for perimeter subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "manufacturing_vnet_name" {
  description = "Name of manufacturing virtual network"
  type        = string
  default     = "ManufacturingVnet"
}

variable "manufacturing_vnet_address_space" {
  description = "Address space for manufacturing VNet"
  type        = list(string)
  default     = ["172.16.0.0/16"]
}

variable "manufacturing_subnet_name" {
  description = "Name of manufacturing subnet"
  type        = string
  default     = "Manufacturing"
}

variable "manufacturing_subnet_prefix" {
  description = "Address prefix for manufacturing subnet"
  type        = string
  default     = "172.16.0.0/24"
}

variable "core_vm_name" {
  description = "Name of core services VM"
  type        = string
  default     = "CoreServicesVM"
}

variable "manufacturing_vm_name" {
  description = "Name of manufacturing VM"
  type        = string
  default     = "ManufacturingVM"
}

variable "vm_size" {
  description = "Size of virtual machines"
  type        = string
  default     = "Standard_B2ms"
}

variable "nva_ip" {
  description = "Future NVA IP address"
  type        = string
  default     = "10.0.1.7"
}