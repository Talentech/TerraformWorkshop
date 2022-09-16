variable "key_vault_id" {
  type = string
}

variable "secrets" {
  type = list(object({
    key   = string
    value = string
  }))
}
