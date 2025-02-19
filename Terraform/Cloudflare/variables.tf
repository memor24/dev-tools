variable "cloudflare_api_token" {
    default = "ABCDEF..."
type= string
sensitive = true
}


variable "cloudflare_zone" {
  default = "mehdimorshedi.pro"
  type    = string
}

# variable "cloudflare_zone_id" {
#     description="the id of the cloudflare zone"
# }