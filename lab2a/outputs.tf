output "management_group_id" {
  description = "Created management group ID"
  value       = azurerm_management_group.az104_mg1.id
}

output "custom_role_id" {
  description = "Custom Support Request role definition ID"
  value       = azurerm_role_definition.custom_support_request.role_definition_id
}

output "helpdesk_group_object_id" {
  description = "Help Desk group object ID"
  value       = azuread_group.helpdesk.object_id
}