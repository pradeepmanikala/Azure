resource "azurerm_recovery_services_vault" "vault" {
  name                = "${var.clientname}-${var.location}-rsv1"
  location            = var.location
  resource_group_name = "${var.clientname}-${var.location}-${var.rgnames[2]}-RG1"
  sku                 = "Standard"
  storage_mode_type = "LocallyRedundant"
  soft_delete_enabled = true
  depends_on = [azurerm_resource_group.rg

  ]
}