//https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "resource_group" {
  name     = "rg-vm"
  location = var.location
  tags     = local.common_tags
}

//https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip
resource "azurerm_public_ip" "public_ip" {
  name                = "public-ip-colombo"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
  allocation_method   = "Dynamic"

  tags = local.common_tags
}

//https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface
resource "azurerm_network_interface" "network_interface" {
  name                = "nic-colombo"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "public-ip-colombo"
    subnet_id                     = data.terraform_remote_state.data-vnet.outputs.subnet-id
    private_ip_address_allocation = "Dynamic"
    //https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#public_ip_address_id
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
  tags = local.common_tags
}

//https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association
resource "azurerm_network_interface_security_group_association" "nisga" {
  network_interface_id      = azurerm_network_interface.network_interface.id
  network_security_group_id = data.terraform_remote_state.data-vnet.outputs.security-group-id
}


//https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "colombo-vm"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "terraform"
  network_interface_ids = [
    azurerm_network_interface.network_interface.id,
  ]

  admin_ssh_key {
    username   = "terraform"
    public_key = file("./az-key.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}