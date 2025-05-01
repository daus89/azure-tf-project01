resource "azurerm_virtual_network" "vnet1" {
    name = var.vnet1
    address_space = var.address_space
    location = var.location
    resource_group_name = var.resource_group_name
  
}

resource "azurerm_subnet" "subnet1" {
    name = var.subnet_name
    resource_group_name = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.vnet1.name
    address_prefixes = var.address_prefixes
  
}

resource "azurerm_network_security_group" "sg1" {
  name = var.nsg_name
  location = var.location
  resource_group_name = var.resource_group_name
  
  security_rule {
        name                       = var.rule_name
        priority                   = var.priority
        direction                  = var.direction
        access                     = var.access
        protocol                   = var.protocol
        source_port_range          = var.source_port_range
        destination_port_range     = var.destination_port_range
        source_address_prefix      = var.source_address_prefix
        destination_address_prefix = var.destination_address_prefix
    }
}