variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group."
  type        = string
  default     = "az104-rg2"
}

variable "location" {
  description = "Azure region for resource deployment."
  type        = string
  default     = "East US"
}

variable "tag_name" {
  description = "The tag name to enforce."
  type        = string
  default     = "Cost Center"
}

variable "cost_center_tag" {
  description = "The tag value for Cost Center."
  type        = string
  default     = "000"
}

variable "lock_name" {
  description = "Name of the resource lock."
  type        = string
  default     = "rg-lock"
}
