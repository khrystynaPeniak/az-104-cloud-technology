data "azurerm_subscription" "current" {}

resource "azurerm_management_group" "az104_mg1" {
  name                       = var.management_group_id
  display_name               = var.management_group_display_name
}

resource "azurerm_management_group_subscription_association" "az104_mg1" {
  management_group_id = azurerm_management_group.az104_mg1.id
  subscription_id     = "/subscriptions/${data.azurerm_subscription.current.subscription_id}"
}

resource "azuread_group" "helpdesk" {
  display_name     = var.helpdesk_group_name
  security_enabled = true
  description      = var.helpdesk_group_description
}


resource "azurerm_role_assignment" "virtual_machine_contributor" {
  scope                = azurerm_management_group.az104_mg1.id
  role_definition_name = "Virtual Machine Contributor"
  principal_id         = azuread_group.helpdesk.object_id

  depends_on = [
    azurerm_management_group.az104_mg1,
    azuread_group.helpdesk
  ]
}


resource "azurerm_role_definition" "custom_support_request" {
  name        = var.custom_role_name
  scope       = azurerm_management_group.az104_mg1.id
  description = var.custom_role_description

  permissions {
    actions = [
      "Microsoft.Resources/subscriptions/resourceGroups/read",
      "Microsoft.Support/*"
    ]
    not_actions = [
      "Microsoft.Support/register/action"
    ]
  }

  assignable_scopes = [
    azurerm_management_group.az104_mg1.id
  ]

  depends_on = [
    azurerm_management_group.az104_mg1
  ]
}


resource "azurerm_role_assignment" "custom_support_request" {
  scope              = azurerm_management_group.az104_mg1.id
  role_definition_id = azurerm_role_definition.custom_support_request.role_definition_resource_id
  principal_id       = azuread_group.helpdesk.object_id

  depends_on = [
    azurerm_management_group.az104_mg1,
    azurerm_role_definition.custom_support_request,
    azuread_group.helpdesk
  ]
}