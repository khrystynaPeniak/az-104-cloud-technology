variable "user_password" {
  type        = string
  description = "Password for az104-user1"
}

variable "usage_location" {
  type        = string
  default     = "US"
}

variable "external_user_display_name" {
  type        = string
  default     = "External Guest User"
}

variable "external_user_email" {
  type        = string
  description = "Email address of the invited guest user"
}