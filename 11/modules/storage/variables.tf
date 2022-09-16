variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_accounts_with_tables" {
  description = "Storage account's name"
  type = list(object(
    {
      storage_account = string,
      tables          = list(string)
    }
  ))
}
