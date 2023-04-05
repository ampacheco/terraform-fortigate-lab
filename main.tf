// Resource Group

resource "azurerm_resource_group" "myterraformgroup" {
  name     = "[cahnge-me-use-internal-guidelines]"
  location = var.location

  tags = {
    
    # Use internal guidlines to tag resources group
    environment = "Terraform Single FortiGate"
    
  }
}
