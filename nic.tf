resource "azurerm_network_interface" "nic" {
  for_each = var.subnets
  name                = "${var.clientname}-${var.location}-nic"
  location            = var.location
  resource_group_name = "${var.clientname}-${var.location}-${var.rgnames[0]}-RG1"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip.id
  }
  depends_on = [
    azurerm_subnet.subnet
  ]
}