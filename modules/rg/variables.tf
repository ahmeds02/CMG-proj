variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
}

variable "location" {
  type        = string
  description = "Azure region where the resource group should be created."
}

variable "resource_tags" {
  type        = map(string)
  description = "Map of tags to be applied to the resource group."
}
