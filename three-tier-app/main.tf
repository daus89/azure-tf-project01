# main.tf content placeholder
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = "staging"
    managed-by  = "Terraform"
  }
}