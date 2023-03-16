provider "azurerm" {
  features {}
}

module "rg" {
  source       = "../rg"
  location     = var.location
  rg_name      = var.rg_name
  rg_tags      = var.rg_tags
}

module "network" {
  source               = "../network"
  location             = var.location
  vnet_name            = var.vnet_name
  vnet_cidr            = var.vnet_cidr
  subnet_name          = var.subnet_name
  subnet_cidr          = var.subnet_cidr
  resource_group_name  = module.rg.resource_group_name
  subnet_tags          = var.subnet_tags
  vnet_tags            = var.vnet_tags
}

module "aks" {
  source                = "../aks"
  aks_name              = var.aks_name
  location              = var.location
  resource_group_name   = module.rg.resource_group_name
  node_count            = var.node_count
  node_size             = var.node_size
  client_id             = var.client_id
  client_secret         = var.client_secret
  docker_image          = var.docker_image
  container_port        = var.container_port
  service_port          = var.service_port
  subnet_id             = module.network.subnet_id
  aks_tags              = var.aks_tags
}

resource "azurerm_kubernetes_service" "this" {
  name                = var.app_name
  location            = var.location
  resource_group_name = module.rg.resource_group_name
  depends_on          = [module.aks]

  dns_prefix          = var.dns_prefix
  linux_profile {
    admin_username = var.admin_username
    ssh_key {
      key_data = var.ssh_key
    }
  }

  agent_pool_profile {
    count           = var.node_count
    name            = var.agent_pool_name
    vm_size         = var.node_size
    os_type         = "Linux"
    vnet_subnet_id  = module.network.subnet_id
    max_pods        = 30
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  role_based_access_control {
    enabled = true
  }

  tags = var.app_tags
}
