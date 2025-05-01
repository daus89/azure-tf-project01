output "public_ips" {
  value = azurerm_public_ip.publicip[*].ip_address
}