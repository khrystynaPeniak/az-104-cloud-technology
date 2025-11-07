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
  default     = "az104-rg9"
}

variable "container_app_name" {
  description = "Name of the container app"
  type        = string
  default     = "my-app"
}

variable "container_app_environment_name" {
  description = "Name of the container app environment"
  type        = string
  default     = "my-environment"
}

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics Workspace"
  type        = string
  default     = "law-containerapp"
}