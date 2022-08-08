#This block is to create virtualnetwork with two address space. And Virtual network to be part of network RG.
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.clientname}-${var.location}-${var.vnetname}"
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = "${var.clientname}-${var.location}-${var.rgnames[1]}-RG1"
  depends_on = [azurerm_resource_group.rg]
}

