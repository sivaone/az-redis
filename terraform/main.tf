
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "kube" {
  name                = "svkube"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "svkube"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = var.node_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Env = "Kube"
  }
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.kube.kube_config_raw
  sensitive = true
}