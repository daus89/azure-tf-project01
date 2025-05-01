variable "vnet1" {
  description = "The name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "subnet_names" {
  description = "The name of the subnet"
  type        = list(string)
}

variable "address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
}

variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
}

variable "rule_name" {
  description = "The name of the security rule"
  type        = string
}

variable "priority" {
  description = "The priority of the security rule"
  type        = number
}

variable "direction" {
  description = "The direction of the security rule (Inbound or Outbound)"
  type        = string
}

variable "access" {
  description = "The access type of the security rule (Allow or Deny)"
  type        = string
}

variable "protocol" {
  description = "The protocol for the security rule (Tcp, Udp, or *)"
  type        = string
}

variable "source_port_range" {
  description = "The source port range for the security rule"
  type        = string
}

variable "destination_port_range" {
  description = "The destination port range for the security rule"
  type        = string
}

variable "source_address_prefix" {
  description = "The source address prefix for the security rule"
  type        = string
}

variable "destination_address_prefix" {
  description = "The destination address prefix for the security rule"
  type        = string
}