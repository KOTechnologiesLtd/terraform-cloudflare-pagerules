resource "cloudflare_page_rule" "pagerule" {
  zone_id  = var.zone_id
  for_each = var.pagerules
  priority = (index(keys(var.pagerules), each.key) + 1)
  status   = lookup(each.value, "status", "")
  target   = lookup(each.value, "target", "")
  actions {
    always_use_https            = length(keys(lookup(each.value.actions, "always_use_https", {}))) == 0 ? null : "true"
    security_level              = length(keys(lookup(each.value.actions, "security_level", {}))) == 0 ? null : lookup(each.value.actions.security_level, "value")
    cache_level                 = length(keys(lookup(each.value.actions, "cache_level", {}))) == 0 ? null : lookup(each.value.actions.cache_level, "value")
    host_header_override        = length(keys(lookup(each.value.actions, "host_header_override", {}))) == 0 ? null : lookup(each.value.actions.host_header_override, "value")
    resolve_override            = length(keys(lookup(each.value.actions, "resolve_override", {}))) == 0 ? null : lookup(each.value.actions.resolve_override, "value")
    edge_cache_ttl              = length(keys(lookup(each.value.actions, "edge_cache_ttl", {}))) == 0 ? null : lookup(each.value.actions.edge_cache_ttl, "value")
    ip_geolocation              = length(keys(lookup(each.value.actions, "ip_geolocation", {}))) == 0 ? null : lookup(each.value.actions.ip_geolocation, "value")
    automatic_https_rewrites    = length(keys(lookup(each.value.actions, "automatic_https_rewrites", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    browser_cache_ttl           = length(keys(lookup(each.value.actions, "browser_cache_ttl", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    browser_check               = length(keys(lookup(each.value.actions, "browser_check", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    bypass_cache_on_cookie      = length(keys(lookup(each.value.actions, "bypass_cache_on_cookie", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    cache_by_device_type        = length(keys(lookup(each.value.actions, "cache_by_device_type", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    cache_deception_armor       = length(keys(lookup(each.value.actions, "cache_deception_armor", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    cache_key_fields            = length(keys(lookup(each.value.actions, "cache_key_fields", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    cache_on_cookie             = length(keys(lookup(each.value.actions, "cache_on_cookie", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    cache_ttl_by_status         = length(keys(lookup(each.value.actions, "cache_ttl_by_status", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    disable_apps                = length(keys(lookup(each.value.actions, "disable_apps", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    disable_performance         = length(keys(lookup(each.value.actions, "disable_performance", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    disable_railgun             = length(keys(lookup(each.value.actions, "disable_railgun", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    disable_security            = length(keys(lookup(each.value.actions, "disable_security", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    disable_zaraz               = length(keys(lookup(each.value.actions, "disable_zaraz", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    email_obfuscation           = length(keys(lookup(each.value.actions, "email_obfuscation", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    explicit_cache_control      = length(keys(lookup(each.value.actions, "explicit_cache_control", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    forwarding_url              = length(keys(lookup(each.value.actions, "forwarding_url", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    mirage                      = length(keys(lookup(each.value.actions, "mirage", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    opportunistic_encryption    = length(keys(lookup(each.value.actions, "opportunistic_encryption", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    origin_error_page_pass_thru = length(keys(lookup(each.value.actions, "origin_error_page_pass_thru", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    polish                      = length(keys(lookup(each.value.actions, "polish", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    respect_strong_etag         = length(keys(lookup(each.value.actions, "respect_strong_etag", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    response_buffering          = length(keys(lookup(each.value.actions, "response_buffering", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    rocket_loader               = length(keys(lookup(each.value.actions, "rocket_loader", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    server_side_exclude         = length(keys(lookup(each.value.actions, "server_side_exclude", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    smart_errors                = length(keys(lookup(each.value.actions, "smart_errors", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    sort_query_string_for_cache = length(keys(lookup(each.value.actions, "sort_query_string_for_cache", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    ssl                         = length(keys(lookup(each.value.actions, "ssl", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    true_client_ip_header       = length(keys(lookup(each.value.actions, "true_client_ip_header", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    waf                         = length(keys(lookup(each.value.actions, "waf", {}))) == 0 ? null : lookup(each.value.actions.browser_check, "value")
    dynamic "forwarding_url" {
      for_each = length(keys(lookup(each.value.actions, "forwarding_url", {}))) == 0 ? toset([]) : toset([lookup(each.value.actions, "forwarding_url")])
      content {
        url         = lookup(forwarding_url.value, "url")
        status_code = lookup(forwarding_url.value, "status_code")
      }
    }
    dynamic "minify" {
      for_each = length(keys(lookup(each.value.minifyaction, "minify", {}))) == 0 ? toset([]) : toset([lookup(each.value.actions, "minify")])
      content {
        html = lookup(forwarding_url.value, "html")
        css  = lookup(forwarding_url.value, "css")
        js   = lookup(forwarding_url.value, "js")
      }
    }
  }
}