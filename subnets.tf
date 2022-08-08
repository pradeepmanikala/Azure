#This block is to create multiple subnets under virtual network. Here I have used for each
resource "azurerm_subnet" "subnet" {
  for_each = var.subnets
  resource_group_name = "${var.clientname}-${var.location}-${var.rgnames[1]}-RG1"
  virtual_network_name = azurerm_virtual_network.vnet.name
  name                 = "${var.clientname}-${var.location}-${each.value["name"]}-snet"
  address_prefixes     = each.value["address_prefixes"]
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}