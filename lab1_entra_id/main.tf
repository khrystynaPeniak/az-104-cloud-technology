data "azuread_client_config" "current" {}

data "azuread_domains" "default" {
  only_initial = true
}

locals {
  domain_name = data.azuread_domains.default.domains[0].domain_name
}

resource "azuread_user" "az104_user1" {
  user_principal_name   = "az104-user1@${local.domain_name}"
  display_name          = "az104-user1"
  mail_nickname         = "az104-user1"
  password              = var.user_password
  force_password_change = false
  account_enabled       = true

  job_title      = "IT Lab Administrator"
  department     = "IT"
  usage_location = var.usage_location
}

resource "azuread_invitation" "external_user" {
  user_display_name  = var.external_user_display_name
  user_email_address = var.external_user_email
  redirect_url       = "https://portal.azure.com"

  message {
    body     = "Welcome to Azure and our group project!"
  }
}

resource "azuread_group" "it_lab_admins" {
  display_name     = "IT Lab Administrators"
  description      = "Administrators that manage the IT lab"
  security_enabled = true
  mail_enabled     = false

  owners = [
    data.azuread_client_config.current.object_id
  ]
  
  members = [
    azuread_user.az104_user1.object_id
  ]
}

resource "azuread_group_member" "member_guest" {
  depends_on       = [azuread_invitation.external_user]
  group_object_id  = azuread_group.it_lab_admins.object_id
  member_object_id = azuread_invitation.external_user.user_id
}
