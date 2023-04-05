resource "azurerm_network_interface" "win11nic" {
  name                = "nic-windows10-vm"
  location            = var.location
  resource_group_name = azurerm_resource_group.myterraformgroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.privatesubnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.1.1.5"
  }
}

resource "azurerm_windows_virtual_machine" "windows11-vm" {
  name                = "windows11-vm"
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  location            = var.location
  size                = "Standard_F2s_v2"
  admin_username      = "azureadmin"
  admin_password      = var.adminpassword
  network_interface_ids = [
    azurerm_network_interface.win11nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "windows-11"
    sku       = "win11-22h2-pro"
    version   = "latest"
  }
}
