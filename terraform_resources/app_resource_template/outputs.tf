# #############################################################################
# # OUTPUTS
# #############################################################################

output "environment" {
  value = module.app_resources.environment
}

# Resource group output

output "resource_group" {
  value = module.app_resources.resource_group
}

# App insights output

output "application_insights" {
  value = module.app_resources.application_insights
}

# CosmosDB output

output "cosmos_db_account_endpoints" {
  value = module.app_resources.cosmosdb_account_endpoints
}

output "traffic_manager_profiles" {
  value = module.app_resources.traffic_manager_profiles
}

output "traffic_manager_endpoints" {
  value = module.app_resources.traffic_manager_azure_endpoints
}
