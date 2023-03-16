output "kube_config_raw" {
  description = "Raw Kubernetes configuration data for accessing the AKS cluster."
  value       = module.aks_cluster.kube_config_raw
}

output "kube_config" {
  description = "Kubernetes configuration file for accessing the AKS cluster."
  value       = module.aks_cluster.kube_config
}

output "client_certificate" {
  description = "Client certificate for accessing the AKS cluster."
  value       = module.aks_cluster.client_certificate
}

output "client_key" {
  description = "Client key for accessing the AKS cluster."
  value       = module.aks_cluster.client_key
}

output "cluster_ca_certificate" {
  description = "Cluster CA certificate for accessing the AKS cluster."
  value       = module.aks_cluster.cluster_ca_certificate
}

output "host" {
  description = "The host URL for the AKS cluster."
  value       = module.aks_cluster.host
}

output "kube_admin_config" {
  description = "Kubeconfig for accessing the AKS cluster as an admin."
  value       = module.aks_cluster.kube_admin_config
}

output "kube_admin_config_raw" {
  description = "Raw kubeconfig data for accessing the AKS cluster as an admin."
  value       = module.aks_cluster.kube_admin_config_raw
}
