# Create virtual network
resource "azurerm_virtual_network" "virtual_network" {
  name                = var.virtual_network_name
  address_space       = [var.virtual_network_cidr]
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.resource_tags
}

# Create subnet
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [var.subnet_cidr]

  tags = var.resource_tags
}

# Create network security group
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowInboundTraffic"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = var.rule_protocol
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = var.resource_tags
}
