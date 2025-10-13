variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure AD tenant ID"
  type        = string
}

variable "management_group_id" {
  description = "Management group ID (must be unique in the directory)"
  type        = string
  default     = "az104-mg1"
}

variable "management_group_display_name" {
  description = "Management group display name"
  type        = string
  default     = "az104-mg1"
}

variable "helpdesk_group_name" {
  description = "Help Desk group name in Azure AD"
  type        = string
  default     = "helpdesk"
}

variable "helpdesk_group_description" {
  description = "Help Desk group description"
  type        = string
  default     = "Help desk support group"
}

variable "custom_role_name" {
  description = "Custom role name"
  type        = string
  default     = "Custom Support Request"
}

variable "custom_role_description" {
  description = "Custom role description"
  type        = string
  default     = "Custom contributor role for support requests."
}