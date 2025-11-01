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

variable "web_app_name" {
  description = "Globally unique name for the web app"
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "asp-webapp-plan"
}

variable "php_version" {
  description = "PHP version for the runtime stack"
  type        = string
  default     = "8.2"
}

variable "staging_slot_name" {
  description = "Name of the staging deployment slot"
  type        = string
  default     = "staging"
}

variable "github_repo_url" {
  description = "External GitHub repository URL"
  type        = string
  default     = "https://github.com/Azure-Samples/php-docs-hello-world"
}

variable "github_branch" {
  description = "GitHub repository branch"
  type        = string
  default     = "master"
}

variable "autoscale_max_instances" {
  description = "Maximum number of instances for autoscaling"
  type        = number
  default     = 2
}
