variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "virtual_network_cidr" {
  description = "The address space of the virtual network in CIDR notation"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "The address space of the subnet in CIDR notation"
  type        = string
}

variable "location" {
  description = "The location/region where the network resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the network resources will be created"
  type        = string
}

variable "resource_tags" {
  description = "A map of tags to apply to the network resources"
  type        = map(string)
}
