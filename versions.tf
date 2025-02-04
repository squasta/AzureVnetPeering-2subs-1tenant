# Terraform and providers versions

#   _______                   __                                           _                                              _     _               
#  |__   __|                 / _|                                         (_)               ___                          (_)   | |              
#     | | ___ _ __ _ __ __ _| |_ ___  _ __ _ __ ___    __   _____ _ __ ___ _  ___  _ __    ( _ )     _ __  _ __ _____   ___  __| | ___ _ __ ___ 
#     | |/ _ \ '__| '__/ _` |  _/ _ \| '__| '_ ` _ \   \ \ / / _ \ '__/ __| |/ _ \| '_ \   / _ \/\  | '_ \| '__/ _ \ \ / / |/ _` |/ _ \ '__/ __|
#     | |  __/ |  | | | (_| | || (_) | |  | | | | | |   \ V /  __/ |  \__ \ | (_) | | | | | (_>  <  | |_) | | | (_) \ V /| | (_| |  __/ |  \__ \
#     |_|\___|_|  |_|  \__,_|_| \___/|_|  |_| |_| |_|    \_/ \___|_|  |___/_|\___/|_| |_|  \___/\/  | .__/|_|  \___/ \_/ |_|\__,_|\___|_|  |___/
#                                                                                                   | |                                         
#                                                                                                   |_|                                         

terraform {
  required_version = ">= 1.5"

  required_providers {
    azurerm = {
      # The "hashicorp" namespace is the new home for the HashiCorp-maintained
      # provider plugins.
      #
      # source is not required for the hashicorp/* namespace as a measure of
      # backward compatibility for commonly-used providers, but recommended for
      # explicitness.
      # Configure the Azure Provider
      # more info : https://github.com/terraform-providers/terraform-provider-azurerm
      # Check Changelog : https://github.com/terraform-providers/terraform-provider-azurerm/blob/master/CHANGELOG.md
      source  = "hashicorp/azurerm"
      version = "= 3.91"
    }

  }
}

# The first “azurerm” provider definition is our “default” provider
# this definition will be used when in a resource definition no provider is specified.
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  # More information on the `features` block https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#features
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  tenant_id       = var.TenantID
  subscription_id = var.SubscriptionID-Hub
  client_id       = var.ApplicationID
  client_secret   = var.ApplicationSecret  
}

# Second "azurerm" provider definition is our "Subscription-Spoke" provider
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  tenant_id       = var.TenantID
  subscription_id = var.SubscriptionID-Spoke
  client_id       = var.ApplicationID
  client_secret   = var.ApplicationSecret
  # Alias for the provider
  # cf. https://developer.hashicorp.com/terraform/language/providers/configuration#alias-multiple-provider-configurations
  alias = "Subscription-Spoke"
}