output "vnet_id" {
  value = azurerm_virtual_network.vnet1.id
  description = "value of the virtual network id"
}

output "subnet_id" {
  value = azurerm_subnet.subnet1.id
  description = "value of the subnet id"
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg1.id
  description = "value of the network security group id"
}