#This block is to create network security group
resource "azurerm_network_security_group" "nsg" {
  for_each = var.subnets 
  name                = "${var.clientname}-${var.location}-${var.vnetname}-${each.value["name"]}-nsg"
  location            = var.location
  resource_group_name = "${var.clientname}-${var.location}-${var.rgnames[1]}-RG1"
  security_rule {
    name                        = "RDP-3389-allow"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = 3389
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
  }
  depends_on = [
    azurerm_virtual_network.vnet, azurerm_subnet.subnet
  ]
}

#This block is to associate subnet with particular NSG.
resource "azurerm_subnet_network_security_group_association" "nsg-association" {
    for_each = var.subnets  
    subnet_id                 = azurerm_subnet.subnet[each.key].id
    network_security_group_id = azurerm_network_security_group.nsg[each.key].id
    depends_on = [
       azurerm_network_security_group.nsg, azurerm_subnet.subnet
      ]
}

