remote_state {
  backend = "azurerm"
  config = {
    resource_group_name  = "Microsoftfabric"
    storage_account_name = "datalake63"
    container_name       = "blob"
    key                  = "${path_relative_to_include()}/terraform.tfstate"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "azurerm" {
  features {}
  subscription_id = "${local.env.locals.subscription_id}"
  resource_provider_registrations = "none"
}
EOF 
}

locals {
  env = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}