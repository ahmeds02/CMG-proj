# Output the DNS name of the AKS cluster
output "aks_dns_name" {
  value = azurerm_kubernetes_cluster.my_aks.kubernetes_cluster_name
}

# Output the kubeconfig file to use with the kubectl command
output "kubeconfig" {
  value = azurerm_kubernetes_cluster.my_aks.kube_config_raw
}

# Output the public IP address of the Load Balancer
output "load_balancer_ip" {
  value = kubernetes_service.my_app.status.0.load_balancer.0.ingress.0.ip
}
