# Peering 2 Azure VNets in 2 different Azure Subscriptions in the same AAD/EntraID tenant

# Azure Virtual Network peering between VNet Hub to VNet Spoke
resource "azurerm_virtual_network_peering" "TF_Peer_Hub2Spoke" {
  name                         = "peering-vnet-Hub2Spoke"
  resource_group_name          = var.ResourceGroupName-VNet-Hub
  virtual_network_name         = var.VNetName-Hub
  remote_virtual_network_id    = var.VNetID-Spoke
  allow_virtual_network_access = true
  allow_gateway_transit = true
  timeouts {
    create = "60m"
  }
}


# Azure Virtual Network peering between VNet spoke Network B and A
resource "azurerm_virtual_network_peering" "TF_Peer_Spoke2Hub" {
  name                         = "peering-vnet-Spoke2Hub"
  resource_group_name          = var.ResourceGroupName-VNet-Spoke
  virtual_network_name         = var.VNetName-Spoke
  remote_virtual_network_id    = var.VNetID-Hub
  allow_virtual_network_access = true
  use_remote_gateways = true
  provider = azurerm.Subscription-Spoke
  depends_on = [azurerm_virtual_network_peering.TF_Peer_Hub2Spoke]
   timeouts {
    create = "60m"
  }
}