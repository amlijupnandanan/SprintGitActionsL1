# Configure Terraform to set the required AzureRM provider
# version and features{} block


# Define the provider configuration



# Get the current client configuration from the AzureRM provider

data "azurerm_client_config" "current" {}

# The following module declarations act to orchestrate the
# independently defined module instances for core,
# connectivity and management resources

module "landingzones" {
  source = "./modules/landingzones"
  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_id          = var.root_id
  root_name        = var.root_name
  primary_location = var.primary_location
}
