variable "resource_group_name" {
  type = string
}

variable "storage_account_name" {
  description = "Storage account's name"
  type        = string
  default     = ""
}

variable "storage_account" {
  description = "Storage account's name"
  type = object({
    name = string
  })
  default = { name = "" }
}
