resource "azurerm_resource_group" "meuresoursegroup" {
  name     = "colombo-resource-state"
  location = var.location
  tags     = local.common_tags
}


resource "azurerm_storage_account" "meustorageaccount" {
  name                     = "colombostorageaccountst"
  resource_group_name      = azurerm_resource_group.meuresoursegroup.name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                     = local.common_tags
  blob_properties {
    versioning_enabled = true
  }
}

resource "azurerm_storage_container" "container" {
  name                  = "remote-state"
  storage_account_name  = azurerm_storage_account.meustorageaccount.name
  container_access_type = "private"
}