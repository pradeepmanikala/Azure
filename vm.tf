resource "azurerm_windows_virtual_machine" "vm" {
    for_each = var.subnets
    name                = "${var.clientname}-vm"
    resource_group_name = "${var.clientname}-${var.location}-${var.rgnames[0]}-RG1"
    location            = var.location
    size                = "Standard_B1s"
    admin_username      = "azureadmin"
    admin_password      = "Migration@123"
    network_interface_ids = [
      azurerm_network_interface.nic[each.key].id,
    ]
  
    os_disk {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
  
    source_image_reference {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2016-Datacenter"
      version   = "latest"
    }
    depends_on = [
      azurerm_network_interface.nic
    ]
}