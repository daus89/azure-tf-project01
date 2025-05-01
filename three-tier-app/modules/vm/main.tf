resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "nic-${count.index + 1}"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  ip_configuration {
    name                          = "ipconfig-${count.index + 1}"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip[count.index].id
  }
}

resource "azurerm_network_interface_security_group_association" "nic_nsg_association" {
  count                     = var.vm_count
  network_interface_id      = azurerm_network_interface.nic[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}

resource "azurerm_public_ip" "public_ip" {
  count               = var.vm_count
  name                = "publicIP-${count.index + 1}"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  allocation_method   = "Dynamic"

}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  count                 = var.vm_count
  name                  = "linuxVM-${count.index + 1}"
  location              = azurerm_resource_group.rg1.location
  resource_group_name   = azurerm_resource_group.rg1.name
  size                  = var.vm_size
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]
  admin_username        = var.admin_username
  admin_ssh_key {
    username   = var.admin_username
    public_key = tls_private_key.linux_ssh_key.public_key_openssh
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
    disk_size_gb         = 30
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}