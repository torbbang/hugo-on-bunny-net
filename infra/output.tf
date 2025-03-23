output "bunny_sz_name" {
  value = bunnynet_storage_zone.site.name
}

output "bunny_sz_password" {
  value = bunnynet_storage_zone.site.password
  sensitive = true
}

output "bunny_sz_hostname" {
  value = bunnynet_storage_zone.site.hostname
}
