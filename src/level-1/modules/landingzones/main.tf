

# Get the current client configuration from the AzureRM provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.5.0"
    }
  }
}
data "azurerm_client_config" "current" {}

# Declare the Azure landing zones Terraform module
# and provide the landing zone configuration

module "caf-enterprise-scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "~>4.0.2"

  default_location = var.primary_location

  providers = {

    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  # Base module configuration settings
  # root_parent_id = data.azurerm_client_config.current.tenant_id
  # Base module configuration settings
  #This should be Tenant Root Group
  #root_parent_id = data.azurerm_client_config.current.tenant_id
  root_parent_id = "myexamp"
  #myroot
  root_id = var.root_id
  #myroot
  root_name    = var.root_name
  library_path = "${path.module}/lib"

  # Disable creation of the core management group hierarchy
  # as this is being created by the core module instance
  deploy_core_landing_zones = false

  # Configuration settings for landing zones is in settings.landingzones
  custom_landing_zones = local.custom_landing_zones_org1
}
module "enterprise_scale_lz" {
  source           = "Azure/caf-enterprise-scale/azurerm"
  version          = "~>4.0.2"
  default_location = "centralindia"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id = "landingzone"
  root_id        = var.root_id
  root_name      = var.root_name
  library_path   = "${path.module}/lib"

  deploy_core_landing_zones = false

  custom_landing_zones = local.custom_landing_zones_org1_lz
}

module "enterprise_scale_platform" {
  source           = "Azure/caf-enterprise-scale/azurerm"
  version          = "~>4.0.2"
  default_location = "centralindia"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id = "mg-pf"
  # root_id        = "zeeplatform"
  # root_name      = "zeeplatform"
  library_path = "${path.module}/lib"

  deploy_core_landing_zones = false

  custom_landing_zones = local.custom_landing_zones_org1_lz_nested_mg_lz1

  depends_on = [module.enterprise_scale_lz]
}

# resource "azurerm_management_group_policy_assignment" "policy_assign" {
#   name = "assign-audit-rbac"
#   management_group_id = "/providers/Microsoft.Management/managementGroups/mg-pf"
#   policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a451c1ef-c6ca-483d-87ed-f49761e3ffb5"

# }