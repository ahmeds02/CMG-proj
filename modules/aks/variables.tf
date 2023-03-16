variable "aks_name" {
  type        = string
  description = "The name of the AKS cluster"
}

variable "location" {
  type        = string
  description = "The location/region where the AKS cluster will be created"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group to create the AKS cluster in"
}

variable "node_count" {
  type        = number
  description = "The number of worker nodes in the AKS cluster"
}

variable "node_size" {
  type        = string
  description = "The size of the worker nodes in the AKS cluster"
}

variable "client_id" {
  type        = string
  description = "The client ID of the service principal to authenticate with the AKS cluster"
}

variable "client_secret" {
  type        = string
  description = "The client secret of the service principal to authenticate with the AKS cluster"
}

variable "docker_image" {
  type        = string
  description = "The Docker image to deploy to the AKS cluster"
}

variable "container_port" {
  type        = number
  description = "The port to expose on the container"
}

variable "service_port" {
  type        = number
  description = "The port to expose on the AKS service"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet where the AKS cluster will be created"
}

variable "resource_tags" {
  type        = map(string)
  description = "A map of tags to apply to all resources in the module"
}
