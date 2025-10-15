#1
resource "azurerm_resource_group" "az104_rg2" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    CostCenter = var.cost_center_tag
  }
}

#2
data "azurerm_policy_definition" "require_tag" {
  display_name = "Require a tag and its value on resources"
}

# resource "azurerm_resource_group_policy_assignment" "temporary_test" {
#   name                 = "require-temp-cc-tag"
#   resource_group_id    = azurerm_resource_group.az104_rg2.id
#   policy_definition_id = data.azurerm_policy_definition.require_tag.id
#   display_name         = "Require temporary Cost Center tag and its value on resources"
#   description          = "Temporary policy to require Cost Center tag and its value on all resources in the resource group"
#
#   parameters = jsonencode({
#     tagName  = { value = var.tag_name }
#     tagValue = { value = var.cost_center_value }
#   })
# }

resource "azurerm_resource_group_policy_assignment" "az104_policy" {
  name                 = "Require-CostCenter-Tag"
  resource_group_id    = azurerm_resource_group.az104_rg2.id
  policy_definition_id = data.azurerm_policy_definition.require_tag.id
  display_name         = "Require Cost Center tag and its value on resources"
  description          = "Require Cost Center tag and its value on all resources in the resource group"

  parameters = jsonencode({
    tagName  = { value = var.tag_name }
    tagValue = { value = var.cost_center_tag }
  })
}

#3
data "azurerm_policy_definition" "inherit_tag" {
  display_name = "Inherit a tag from the resource group if missing"
}

resource "azurerm_resource_group_policy_assignment" "az104_inherit_policy" {
  name                 = "Inherit-CostCenter-Tag"
  resource_group_id    = azurerm_resource_group.az104_rg2.id
  policy_definition_id = data.azurerm_policy_definition.inherit_tag.id
  display_name         = "Inherit the Cost Center tag and its value from the resource group if missing"
  description          = "Inherit the Cost Center tag and its value 000 from the resource group if missing"
  location             = azurerm_resource_group.az104_rg2.location

  parameters = jsonencode({
    tagName = { value = var.tag_name }
  })

  identity {
    type = "SystemAssigned"
  }
}

#4
resource "azurerm_management_lock" "az104_lock" {
  name       = var.lock_name
  scope      = azurerm_resource_group.az104_rg2.id
  lock_level = "CanNotDelete"
  notes      = "Lock to prevent deletion of resource group."
}