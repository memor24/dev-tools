terraform {
  required_version = ">= 0.12"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}
provider "cloudflare" {
    api_token = var.cloudflare_api_token
}

resource "cloudflare_dns_record" "new_dns" {
  zone_id = var.cloudflare_zone_id
  name    = "my_dns"
  type    = "CNAME"
  ttl     = 3600
}

resource "cloudflare_page_rule" "new_rule" {
  zone_id = local.cloudflare_zone_id #to get the cloudflare zone id from a data source
  target  = "sub.${var.cloudflare_zone}/*"

  actions {
    ssl = "flexible"
  }
}


#getting the cloudflare zone id
data "cloudflare_zones" "example" {
    filter = var.cloudflare_zone
}
locals{
    cloudflare_zone_id = data.cloudflare_zones.example.zones[0].id
}