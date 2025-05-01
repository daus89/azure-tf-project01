resource "azurerm_virtual_network" "vnet" {
    name = var.vnet_name
    address_space = var.address_space
    location = var.location
    resource_group_name = var.resource_group_name
  
}

resource "azurerm_subnet" "subnets" {
    for_each = zipmap(var.subnet_names, var.address_prefixes)
    name = each.key
    address_prefixes = [each.value]
    resource_group_name = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.vnet1.name
  
}

resource "azurerm_network_security_group" "nsg" {
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