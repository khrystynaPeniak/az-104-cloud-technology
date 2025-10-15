output "resource_group_id" {
  description = "ID of the created Resource Group."
  value       = azurerm_resource_group.az104_rg2.id
}

output "policy_assignment_ids" {
  description = "IDs of the created Policy Assignments."
  value = [
    azurerm_resource_group_policy_assignment.az104_policy.id,
    azurerm_resource_group_policy_assignment.az104_inherit_policy.id
  ]
}

output "lock_id" {
  description = "ID of the created Resource Lock."
  value       = azurerm_management_lock.az104_lock.id
}
