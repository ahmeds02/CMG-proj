resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.aks_name

  linux_profile {
    admin_username = "azureuser"

    ssh_key {
      key_data = var.ssh_key
    }
  }

  agent_pool_profile {
    name            = "agentpool"
    count           = var.node_count
    vm_size         = var.node_size
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  tags = var.resource_tags
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace_name
  }
  depends_on = [azurerm_kubernetes_cluster.aks]
}

resource "kubernetes_service" "service" {
  metadata {
    name = var.service_name
  }
  spec {
    selector = {
      app = var.service_name
    }
    port {
      name       = "http"
      protocol   = "TCP"
      port       = var.container_port
      targetPort = var.container_port
    }
    type = "LoadBalancer"
  }
  depends_on = [kubernetes_namespace.namespace]
}

resource "kubernetes_deployment" "deployment" {
  metadata {
    name = var.deployment_name

    labels = {
      app = var.service_name
    }
  }

  spec {
    replicas = var.replica_count

    selector {
      match_labels = {
        app = var.service_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.service_name
        }
      }

      spec {
        container {
          name  = var.container_name
          image = var.docker_image
          ports {
            container_port = var.container_port
          }
          env {
            name  = "MESSAGE"
            value = "Hello, World!"
          }
        }
      }
    }
  }

  depends_on = [kubernetes_namespace.namespace]
}
