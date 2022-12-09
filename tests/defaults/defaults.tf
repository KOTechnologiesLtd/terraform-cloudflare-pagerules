terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }
    http = {
      source = "hashicorp/http"
    }
  }
}

variable zone_id {
  value = string
  default = "788dsagy78qew8ds123r"
}

variable "pagerules" {
  value = map
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

module "main" {  
    source = "../.."   
}

resource "test_assertions" "pagerule" { 
  component = "pagerule"   
  equal "pagerule_name" {    
    description = "default pagerule_name is pagerule1"    
    got         = module.main.pagerule_name
    want        = "pagerule1"  
  }
}