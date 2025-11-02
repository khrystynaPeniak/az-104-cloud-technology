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

variable "container_name" {
  description = "Name of the container instance"
  type        = string
  default     = "az104-c1"
}

variable "container_image" {
  description = "Docker image to deploy"
  type        = string
  default     = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
}

variable "dns_name_label" {
  description = "DNS name label for the container (must be globally unique)"
  type        = string
}

variable "cpu_cores" {
  description = "Number of CPU cores for the container"
  type        = number
  default     = 1
}

variable "memory_in_gb" {
  description = "Amount of memory in GB for the container"
  type        = number
  default     = 1.5
}
