variable "location" {
  type    = string
  default = "polandcentral"
}

variable "resource_group_name"{
  type = string
  default = "az104-rg3"
}

variable "disk_size_gb" {
  type    = number
  default = 32
}

variable "storage_account_type" {
  description = "Specifies the storage account type for the managed disk."
  type        = string
  default     = "Standard_LRS"
}

variable "create_option" {
  description = "Specifies how the managed disk should be created."
  type        = string
  default     = "Empty"
}

variable "disk_count" {
  description = "Number of managed disks to create."
  type        = number
  default     = 5
}

variable "disk_name_prefix" {
  description = "Prefix for the managed disk names."
  type        = string
  default     = "az104-disk"
}

variable "subscription_id" {
  type = string
}

