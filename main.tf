# Peering 2 Azure VNets in 2 different Azure Subscriptions in the same AAD/EntraID tenant

# Azure Virtual Network peering VNet Hub to VNet Spoke
# cf. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering
resource "azurerm_virtual_network_peering" "TF_Peer_Hub2Spoke" {
  name                         = var.PeerName-Hub2Spoke
  resource_group_name          = var.ResourceGroupName-VNet-Hub
  virtual_network_name         = var.VNetName-Hub
  remote_virtual_network_id    = var.VNetID-Spoke
  allow_virtual_network_access = true
  allow_gateway_transit = true
  timeouts {
    create = "60m"
  }
}


# Azure Virtual Network peering VNet Spoke to VNet Hub
# cf. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering
resource "azurerm_virtual_network_peering" "TF_Peer_Spoke2Hub" {
  name                         = var.PeerName-Spoke2Hub
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