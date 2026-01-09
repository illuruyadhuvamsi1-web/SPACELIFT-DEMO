locals {
  env_name        = "dev"
  location        = "eastus"
  subscription_id = "7603b1fd-aecc-4465-b244-f9edad1c7ed3"

 # Naming prefixes
  rg_prefix       = "rg"
  stg_prefix      = "st"
  vnet_prefix     = "vnet"
  subnet_prefix   = "subnet"
  app_prefix      = "app"

  # Tags
  tags = {
    Environment = local.env_name
    Project     = "MyProject"
    Owner       = "DevOpsTeam"
  }

  # Networking
  vnet_name    = "${local.vnet_prefix}-app1-${local.env_name}-testing"
  subnet_name     = "${local.subnet_prefix}-${local.env_name}"
  address_space   = ["10.0.0.0/16"]
  subnet_prefixes = ["10.0.1.0/24", "10.0.2.0/24"] 

  # Storage default SKU
  storage_sku = "Standard_ZRS"
}
