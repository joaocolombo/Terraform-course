resource "azurerm_resource_group" "meu_resource_group" {
  name     = var.resource_group_name
  location = var.location             //variavel do arquivo variables com nome location
  tags     = local.minhas_commom_tags // local (sem o S) do arquivo locals + nome da propriedade
}


resource "azurerm_storage_account" "meu_storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.meu_resource_group.name //referencia o nome do bloco acima, ATENÇÃO para o nome do recurso
  location                 = var.location                                   //variavel do arquivo variables com nome location
  account_tier             = var.account_tier                               //variavel do arquivo variables com nome account_tier
  account_replication_type = var.account_replication_type                   //variavel do arquivo variables com nome account_replication_type
  tags                     = local.minhas_commom_tags                       // local (sem o S) do arquivo locals + nome da propriedade
}

resource "azurerm_storage_container" "meu_container" {
  name                 = var.container_name
  storage_account_name = azurerm_storage_account.meu_storage_account.name //referencia o nome do bloco acima, ATENÇÃO para o nome do recurso
}