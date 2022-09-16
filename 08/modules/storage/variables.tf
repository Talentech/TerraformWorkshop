variable "resource_group_name" {
  type = string
}
variable "storage_account_name" {
  description = "Storage account's name"
  type        = string
  default     = ""
}

variable "tables" {
  type = list(string)
}
