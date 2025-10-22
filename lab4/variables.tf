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
  default     = "az104-rg4"
}

variable "core_vnet_name" {
  default = "CoreServicesVnet"
}
variable "core_vnet_address_space" {
  default = ["10.20.0.0/16"]
}
variable "core_subnets" {
  default = [
    { name = "SharedServicesSubnet", address_prefix = "10.20.10.0/24" },
    { name = "DatabaseSubnet", address_prefix = "10.20.20.0/24" }
  ]
}

variable "manufacturing_vnet_name" {
  default = "ManufacturingVnet"
}
variable "manufacturing_vnet_address_space" {
  default = ["10.30.0.0/16"]
}
variable "manufacturing_subnets" {
  default = [
    { name = "SensorSubnet1", address_prefix = "10.30.20.0/24" },
    { name = "SensorSubnet2", address_prefix = "10.30.21.0/24" }
  ]
}

# DNS
variable "public_dns_zone_name" {
  default = "contoso12341.com"
}
variable "private_dns_zone_name" {
  default = "private.contoso12341.com"
}
variable "public_dns_a_record_ip" {
  default = "10.1.1.4"
}
variable "private_dns_a_record_ip" {
  type = string
}

variable "asg_name" {
  default = "asg-web"
}
variable "nsg_name" {
  default = "myNSGSecure"
}
