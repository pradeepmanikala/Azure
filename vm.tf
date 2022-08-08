resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.subnets
  name                = "${var.clientname}-vm"
  resource_group_name = "${var.clientname}-${var.location}-${var.rgnames[0]}-RG1"
  location            = var.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = "Migration@123"
  disable_password_authentication = "false"
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

  #admin_ssh_key {
  #  username   = "adminuser"
  #  public_key = file("~/.ssh/id_rsa.pub")
  #}

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  depends_on = [
      azurerm_network_interface.nic
    ]
}