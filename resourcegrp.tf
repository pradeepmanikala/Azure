#This block is to create resource group.Here I have used count

resource "azurerm_resource_group" "rg" {
  count = length(var.rgnames)
  location = var.location
  name     = "${var.clientname}-${var.location}-${var.rgnames[count.index]}-RG1"
  tags = {
    Owner = var.clientname
  }
}