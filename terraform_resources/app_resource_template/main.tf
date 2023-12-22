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
  backend "azurerm" {}

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
  # }
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

module "app_resources" {
  # source = "../../../dep-terraform-modules/application/app_resources"
  source              = "github.com/taa-dev-enablement/dep-terraform-modules.git//application/app_resources?ref=v1.27.2"
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

  createApplicationinsights            = var.createApplicationinsights
  log_analytics_workspace_id           = var.log_analytics_workspace_id
  application_type                     = var.application_type
  daily_data_cap_in_gb                 = var.daily_data_cap_in_gb
  daily_data_cap_notification_disabled = var.daily_data_cap_notification_disabled
  app_insights_retention_in_days       = var.app_insights_retention_in_days
  sampling_percentage                  = var.sampling_percentage
  disable_ip_masking                   = var.disable_ip_masking

  createCosmosdb = var.createCosmosdb

  createTrafficManagerProfile   = var.createTrafficManagerProfile
  traffic_routing_method        = var.traffic_routing_method
  traffic_manager_relative_name = var.traffic_manager_relative_name
  traffic_manager_ttl           = var.traffic_manager_ttl
  traffic_manager_protocol      = var.traffic_manager_protocol
  traffic_manager_port          = var.traffic_manager_port
  traffic_manager_path          = var.traffic_manager_path

  createTrafficManagerEndpoint                           = var.createTrafficManagerEndpoint
  traffic_manager_endpoint_public_ip_name                = var.traffic_manager_endpoint_public_ip_name
  traffic_manager_endpoint_public_ip_resource_group_name = var.traffic_manager_endpoint_public_ip_resource_group_name

  createUserManagedIdentity         = var.createUserManagedIdentity
  role_assignment_principal_id_list = var.role_assignment_principal_id_list
  role_assignment_scope_list        = var.role_assignment_scope_list
}
