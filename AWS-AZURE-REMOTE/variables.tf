variable "location" {
  description = "location dos recursos da azure"
  type        = string
  default     = "Brazil South"
}

variable "account_tier" {
  description = "tier dos recursos da azure"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "replication type dos recursos da azure"
  type        = string
  default     = "LRS"

}