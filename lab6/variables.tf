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
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = string
}

variable "subnet0_address_prefix" {
  description = "Address prefix for subnet0"
  type        = string
}

variable "subnet1_address_prefix" {
  description = "Address prefix for subnet1"
  type        = string
}

variable "subnet2_address_prefix" {
  type        = string
}

variable "subnet_appgw_address_prefix" {
  description = "Address prefix for AppGW subnet"
  type        = string
}

variable "nsg_name" {
  description = "Network Security Group name"
  type        = string
}

# Virtual Machines
variable "vm_size" {
  description = "VM size"
  type        = string
}

variable "vm_admin_username" {
  description = "VM admin username"
  type        = string
}

variable "vm_admin_password" {
  description = "VM admin password"
  type        = string
  sensitive   = true
}

variable "vm_os_disk_storage_type" {
  type        = string
}

variable "vm_image_publisher" {
  type        = string
}

variable "vm_image_offer" {
  type        = string
}

variable "vm_image_sku" {
  description = "VM image SKU"
  type        = string
}

# VM Extensions

variable "vm_extension_publisher" {
  description = "Publisher for VM extension"
  type        = string
}

variable "vm_extension_type" {
  description = "VM extension type"
  type        = string
}

variable "public_ip_sku" {
  description = "Public IP SKU"
  type        = string
}

variable "lb_name" {
  type        = string
}

variable "lb_sku" {
  type        = string
}

variable "appgw_zones" {
  description = "Availability zones for AppGW"
  type        = list(string)
}

variable "appgw_image_backend_pool_name" {
  description = "AppGW image backend pool name"
  type        = string
}

variable "appgw_video_backend_pool_name" {
  description = "AppGW video backend pool name"
  type        = string
}

variable "appgw_backend_http_settings_name" {
  description = "AppGW backend HTTP settings name"
  type        = string
}

variable "appgw_url_path_map_name" {
  description = "AppGW URL path map name"
  type        = string
}

variable "appgw_path_rule_image_name" {
  description = "AppGW path rule for image"
  type        = string
}

variable "appgw_path_rule_image_paths" {
  description = "Paths for image rule"
  type        = list(string)
}

variable "appgw_path_rule_video_name" {
  description = "AppGW path rule for video"
  type        = string
}

variable "appgw_path_rule_video_paths" {
  description = "Paths for video rule"
  type        = list(string)
}