provider "azurerm" {
  features {}
}

module "aks_cluster" {
  source = "./aks_cluster"

  resource_group_name = var.resource_group_name
  location            = var.location
  aks_name            = var.aks_name
  node_count          = var.node_count
  node_size           = var.node_size
  client_id           = var.client_id
  client_secret       = var.client_secret
  docker_image        = var.docker_image
  container_port      = var.container_port
  service_port        = var.service_port
}

output "kube_config" {
  value = module.aks_cluster.kube_config_raw
}

output "kube_config_raw" {
  value = module.aks_cluster.kube_config_raw
}

output "kube_config_raw_output" {
  value = module.aks_cluster.kube_config_raw_output
}

output "kube_config_cluster_ca_certificate" {
  value = module.aks_cluster.kube_config_cluster_ca_certificate
}

output "kube_config_client_key" {
  value = module.aks_cluster.kube_config_client_key
}

output "kube_config_client_certificate" {
  value = module.aks_cluster.kube_config_client_certificate
}

output "kube_config_cluster_host" {
  value = module.aks_cluster.kube_config_cluster_host
}

output "kube_config_username" {
  value = module.aks_cluster.kube_config_username
}

output "kube_config_password" {
  value = module.aks_cluster.kube_config_password
}

output "kube_config_raw_escaped" {
  value = module.aks_cluster.kube_config_raw_escaped
}

output "kube_config_raw_output_escaped" {
  value = module.aks_cluster.kube_config_raw_output_escaped
}

output "kube_config_cluster_ca_certificate_escaped" {
  value = module.aks_cluster.kube_config_cluster_ca_certificate_escaped
}

output "kube_config_client_key_escaped" {
  value = module.aks_cluster.kube_config_client_key_escaped
}

output "kube_config_client_certificate_escaped" {
  value = module.aks_cluster.kube_config_client_certificate_escaped
}

output "kube_config_cluster_host_escaped" {
  value = module.aks_cluster.kube_config_cluster_host_escaped
}

output "kube_config_username_escaped" {
  value = module.aks_cluster.kube_config_username_escaped
}

output "kube_config_password_escaped" {
  value = module.aks_cluster.kube_config_password_escaped
}
