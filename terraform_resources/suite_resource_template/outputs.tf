# #############################################################################
# # OUTPUTS
# #############################################################################

output "environment" {
  value = module.platform_resources.environment
}

# Resource group output

output "resource_group" {
  value = module.platform_resources.resource_group
}

# Container registry output

output "container_registries" {
  value = module.platform_resources.container_registries
}

# Management Lock

output "management_lock" {
  value = module.platform_resources.management_lock
}

# Private endpoint output
output "acr_private_dns_zones" {
  value = module.platform_resources.acr_private_dns_zones
}

output "acr_private_endpoints" {
  value = module.platform_resources.acr_private_endpoints
}

output "acr_private_dns_zone_virtual_network_links" {
  value = module.platform_resources.acr_private_dns_zone_virtual_network_links
}

# Keyvault
output "keyvaults" {
  value = module.platform_resources.keyvaults
}

# Log Analytics Workspace
output "log_analytics_workspaces" {
  value = module.platform_resources.log_analytics_workspaces
}

# Managed Identities
output "user_managed_identities" {
  value = module.platform_resources.user_managed_identities
}

output "role_assignments" {
  value = module.platform_resources.role_assignments
}

output "acr_azurerm_role_assignments" {
  value = module.platform_resources.acr_azurerm_role_assignments
}

output "aks_acr_pull_azurerm_role_assignments" {
  value = module.platform_resources.aks_acr_pull_azurerm_role_assignments
}

output "aks_keyvault_azurerm_role_assignments" {
  value = module.platform_resources.aks_keyvault_azurerm_role_assignments
}

output "keyvault_azurerm_role_assignments" {
  value = module.platform_resources.keyvault_azurerm_role_assignments
}

output "federated_identity_credentials" {
  value = module.platform_resources.federated_identity_credentials
}

# Commented out for security scan
# # Application Gateway
# output "app_gateways" {
#   value = module.platform_resources.app_gateways
# }

# # Application Gateway Public IP
# output "app_gateway_public_ips" {
#   value = module.platform_resources.public_ips
# }
