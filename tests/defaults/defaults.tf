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