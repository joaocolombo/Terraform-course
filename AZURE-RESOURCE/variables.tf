variable "location" {
  description = "Regiao aonde os recuroso serão criados na Azure"
  type        = string
  default     = "Brazil South"
}

variable "account_tier" { //nome igual ao do main.tg para facilitar, mas pode ser qqr nome
  description = "Tier da Storage Account na AZ"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" { //nome igual ao do main.tg para facilitar, mas pode ser qqr nome
  description = "Tipo de replicação de dados da storage account"
  type        = string
  default     = "LRS"
}

variable "resource_group_name" {
  description = "Nome do resourse"
  type        = string
  default     = "rg-curso-terraform"
}

variable "storage_account_name" {
  description = "Nome do storage account"
  type        = string
  default     = "colomboterraformstorage"
}

variable "container_name" {
  description = "Nome do container"
  type        = string
  default     = "meu-container"
}
