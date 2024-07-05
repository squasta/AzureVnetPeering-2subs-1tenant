# Variables definitions

variable "TenantID" {
    description = "Azure Tenant ID"
    type        = string  
}

variable "ApplicationID" {
    description = "Azure Application ID"
    type        = string  
}

variable "ApplicationSecret" {
    description = "Azure Application Secret"
    type        = string  
}

variable "SubscriptionID-Spoke" {
    description = "Azure Subscription ID"
    type        = string  
}

variable "SubscriptionID-Hub" {
    description = "Azure Subscription ID"
    type        = string  
}

variable "ResourceGroupName-VNet-Spoke" {
    description = "Azure Resource Group Name of SPoke VNet"
    type        = string  
}

variable "ResourceGroupName-VNet-Hub" {
    description = "Azure Resource Group Name of Hub VNet"
    type        = string  
}

variable "VNetName-Spoke" {
    description = "Azure VNet Name of Spoke VNet"
    type        = string  
}

variable "VNetID-Spoke" {
    description = "Azure VNet ID of Spoke VNet"
    type        = string  
  
}

variable "VNetName-Hub" {
    description = "Azure VNet Name of Hub VNet"
    type        = string  
}

variable "VNetID-Hub" {
    description = "Azure VNet ID of Hub VNet"
    type        = string  
}

variable "PeerName-Spoke2Hub" {
    description = "Azure VNet Peering Name"
    type        = string  
    default     = "peering-vnet-Spoke2Hub"
}

variable "PeerName-Hub2Spoke" {
    description = "Azure VNet Peering Name"
    type        = string  
    default     = "peering-vnet-Hub2Spoke"
}