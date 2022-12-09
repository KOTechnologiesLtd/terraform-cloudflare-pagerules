# Cloudflare Pagerules module

This Terraform module manages Cloudflare Pagerules.

## Example Usage

```hcl
module "pagerules" {
  source = " KOTechnologiesLtd/pagerules/cloudflare"
  zone_id = ""a1d23s74uhd5s5a213e23wq"
  pagerules = {
    "001" = {
      priority = 1,
      status   = "active",
      target   = "https://www.example.com/page1/heading*",
      actions = {
        resolve_override = {
        value = "sites.example.com" },
        host_header_override = {
        value = "sites.example.digital" },
      }
    },
    "002" = {
      priority = 2,
      status   = "active",
      target   = "https://example.com/*",
      actions = {
        forwarding_url = {
          url = "https://www.example.com/$1",
        status_code = "301" }
      }
    },
    "003" = {
      priority = 3,
      status   = "active",
      target   = "https://www.example.com/page2*",
      actions = {
        resolve_override = {
        value = "this.example.com" },
        host_header_override = {
        value = "this.example.com" },
      }
    },
  }
}
```

## Arguments

<!-- * `zone_name` - The name of the DNS zone. -->

* `Pagerule` -  A list of `Pagerule` objects.
