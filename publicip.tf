#This block is to create a public IP address
resource "azurerm_public_ip" "pip" {
  name                = "${var.clientname}-vm-pip1"
  resource_group_name = "${var.clientname}-${var.location}-${var.rgnames[0]}-RG1"
  location            = var.location
  allocation_method   = "Static"
  depends_on = [
    azurerm_resource_group.rg
  ]

}

