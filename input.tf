variable "pagerules" {
  description = "The configuration of the pagerules according to the format of example"
  value       = map(any)
}

variable "zone_id" {
  description = "The zone Id of the cloudflare env"
  value       = string
}