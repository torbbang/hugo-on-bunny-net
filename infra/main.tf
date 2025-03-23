resource "random_string" "randstring" {
  length           = 4 
  special          = false
  upper            = false
}

resource "bunnynet_storage_zone" "site" {
  name      = "sz-${replace(var.fqdn, ".", "-")}-${random_string.randstring.result}"
  region    = "DE"
  zone_tier = "Edge"
  replication_regions = ["BR", "CZ", "ES", "HK", "JH", "JP", "LA", 
                         "MI", "NY", "SE", "SG", "SYD", "UK", "WA"]
}

resource "bunnynet_pullzone" "site" {
  name = "pz-${replace(var.fqdn, ".", "-")}"
  cache_enabled = false      # Misleading name, this refers to smart caching

  origin {
    type = "StorageZone"
    storagezone = bunnynet_storage_zone.site.id
  }

  routing {
    tier = "Standard"
    zones = ["AF", "ASIA", "EU", "SA", "US"]
  }
  limit_bandwidth = 40 * 1000000000
}

resource "bunnynet_pullzone_hostname" "fqdn" {
  pullzone    = bunnynet_pullzone.site.id
  name        = var.fqdn
  tls_enabled = true
  force_ssl   = true
}
