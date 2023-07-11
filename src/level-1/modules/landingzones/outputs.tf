# Output a copy of custom_landing_zones for use
# by the core module instance

output "configuration" {
  description = "Configuration settings for the \"Management Group\" resources."
  value       = local.custom_landing_zones_org1
}


output "my-string" {
  value = "Hello World"
}
