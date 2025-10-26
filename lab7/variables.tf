variable "subscription_id" {
  type = string
}

variable "location" {
  type    = string
  default = "germanywestcentral"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "az104-rg7"
}

variable "client_ip_address" {
  description = "Your client IPv4 address for storage account access"
  type        = string
}

variable "storage_account_name" {
  description = "Globally unique storage account name"
  type        = string
}


variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "vnet1"
}

variable "vnet_address_space" {
  description = "Address space for virtual network"
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "default"
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for subnet"
  type        = list(string)
}

variable "container_name" {
  description = "Name of the blob container"
  type        = string
  default     = "data"
}

variable "file_share_name" {
  description = "Name of the file share"
  type        = string
  default     = "share1"
}

variable "file_share_quota" {
  description = "Quota for file share in GB"
  type        = number
}

variable "immutability_period_days" {
  description = "Immutability period for blob container in days"
  type        = number
}

variable "soft_delete_retention_days" {
  description = "Soft delete retention period in days"
  type        = number
}

variable "lifecycle_cool_days" {
  description = "Days after modification to move blobs to cool tier"
  type        = number
}