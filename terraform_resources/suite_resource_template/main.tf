#############################################################################
# TERRAFORM PROVIDERS 
#############################################################################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.61.0"
    }
  }
  required_version = ">= 1.4.5"
  backend "azurerm" {
  }

  # # Auth with secret.
  # tenant_id = "8ac76c91-e7f1-41ff-a89c-3553b2da2c17"
  # # env.ARM_TENANT_ID
  # subscription_id = "535d8700-ff37-4ffe-85fc-7d2ba7352a66"
  # # env.ARM_SUBSCRIPTION_ID
  # client_id = "8325f696-03bb-4d3c-acf6-85ea996dc863"
  # # env.ARM_CLIENT_ID
  # # client_secret = var.DEP_TERRAFORM_REMOTE_STATE_CLIENT_SECRET
  # # env.ARM_CLIENT_SECRET

  # resource_group_name  = "zuse1-taa-dxg-rg-p1-depdata1"
  # storage_account_name = "zuse1taadxgstp1depdata1"
  # container_name       = "zuse1-taa-dxg-stct-p1-depdata1"
  # # key                  = "dep_app_cont_reg.tfstate"
}

provider "azurerm" {
  features {}
  #   subscription_id   = "<azure_subscription_id>"
  #   tenant_id         = "<azure_subscription_tenant_id>"
  #   client_id         = "<service_principal_appid>"
  #   client_secret     = "<service_principal_password>"
  #   export ARM_SUBSCRIPTION_ID="<azure_subscription_id>"
  #   export ARM_TENANT_ID="<azure_subscription_tenant_id>"
  #   export ARM_CLIENT_ID="<service_principal_appid>"
  #   export ARM_CLIENT_SECRET="<service_principal_password>"
}

provider "azurerm" {
  features {}
  alias           = "main"
  subscription_id = var.subscription_id
}

#############################################################################
# RESOURCES
#############################################################################

module "platform_resources" {
  source = "github.com/taa-dev-enablement/dep-terraform-modules.git//platform/platform_resources?ref=v1.28.0"
  # source              = "../../../dep-terraform-modules/platform/platform_resources"
  cloud_code          = var.cloud_code
  country_code        = var.country_code
  region_code         = var.region_code
  division_code       = var.division_code
  business_unit_code  = var.business_unit_code
  environment_code    = var.environment_code
  environment_number  = var.environment_number
  app_name_code       = var.app_name_code
  app_suffix_number   = var.app_suffix_number
  location            = var.location
  workload_name       = var.workload_name
  data_classification = var.data_classification
  criticality         = var.criticality
  business_unit       = var.business_unit
  ops_team            = var.ops_team
  cost_center         = var.cost_center
  environment         = var.environment
  owner               = var.owner
  disaster_recovery   = var.disaster_recovery
  organization        = var.organization
  division            = var.division
  environment_type    = var.environment_type
  providers = {
    azurerm = azurerm.main
  }

  createVnet         = var.createVnet
  vnet_address_space = var.vnet_address_space
  subnets            = var.subnets

  createAcr                                   = var.createAcr
  acr_sku                                     = var.acr_sku
  acr_public_network_access_enabled           = var.acr_public_network_access_enabled
  acr_quarantine_policy_enabled               = var.acr_quarantine_policy_enabled
  acr_trust_policy_enabled                    = var.acr_trust_policy_enabled
  acr_georeplications_location                = var.acr_georeplications_location
  acr_georeplications_zone_redundancy_enabled = var.acr_georeplications_zone_redundancy_enabled
  acr_retention_policy_days                   = var.acr_retention_policy_days
  acr_retention_policy_enabled                = var.acr_retention_policy_enabled
  acr_identity_type                           = var.acr_identity_type

  createAcrLock = var.createAcrLock

  createAks                 = var.createAks
  aks_vnet_subnet_id_suffix = var.aks_vnet_subnet_id_suffix
  aks_sku_tier              = var.aks_sku_tier

  createKeyvault                         = var.createKeyvault
  keyvault_soft_delete_retention_days    = var.keyvault_soft_delete_retention_days
  keyvault_purge_protection_enabled      = var.keyvault_purge_protection_enabled
  keyvault_sku                           = var.keyvault_sku
  keyvault_public_network_access_enabled = var.keyvault_public_network_access_enabled
  # keyvault_virtual_network_subnet_ids    = var.keyvault_virtual_network_subnet_ids

  createLoganalyticsws        = var.createLoganalyticsws
  workspace_retention_in_days = var.workspace_retention_in_days

  createACRPrivateEndpoint                      = var.createACRPrivateEndpoint
  acr_private_endpoint_vnet_name                = var.acr_private_endpoint_vnet_name
  acr_private_endpoint_vnet_resource_group_name = var.acr_private_endpoint_vnet_resource_group_name
  pe_acr_environment_list                       = var.pe_acr_environment_list

  caas_aks_name                         = var.caas_aks_name
  caas_aks_resource_group_name          = var.caas_aks_resource_group_name
  enableAcrPullForAks                   = var.enableAcrPullForAks
  aks_acr_pull_environment_list         = var.aks_acr_pull_environment_list
  acr_pull_assignment_principal_id_list = var.acr_pull_assignment_principal_id_list

  createUserManagedIdentity         = var.createUserManagedIdentity
  createFederatedIdentityCredential = var.createFederatedIdentityCredential
  role_assignment_principal_id_list = var.role_assignment_principal_id_list
  role_assignment_scope_list        = var.role_assignment_scope_list
  enableKeyVaultAdminForAks         = var.enableKeyVaultAdminForAks
}
