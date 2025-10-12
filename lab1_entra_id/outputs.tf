output "current_user_object_id" {
  description = "Object ID of the user executing Terraform (the group owner)"
  value       = data.azuread_client_config.current.object_id
}

output "domain_name" {
  description = "Primary domain of your Entra ID"
  value       = local.domain_name
}

output "internal_user_principal_name" {
  description = "UPN (login) of the internal user az104-user1"
  value       = azuread_user.az104_user1.user_principal_name
}

output "internal_user_object_id" {
  description = "Object ID of the internal user az104-user1"
  value       = azuread_user.az104_user1.object_id
}

output "external_user_email" {
  description = "Email of the guest user who received the invitation"
  value       = azuread_invitation.external_user.user_email_address
}

output "external_user_id" {
  description = "Object ID of the guest user after the invitation is accepted"
  value       = azuread_invitation.external_user.user_id
}

output "group_name" {
  description = "Display name of the created group"
  value       = azuread_group.it_lab_admins.display_name
}

output "group_object_id" {
  description = "Object ID of the IT Lab Administrators group"
  value       = azuread_group.it_lab_admins.object_id
}

