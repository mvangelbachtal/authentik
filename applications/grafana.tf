data "authentik_property_mapping_provider_scope" "grafana-property-scopes" {
  managed_list = [
    "goauthentik.io/providers/oauth2/scope-email",
    "goauthentik.io/providers/oauth2/scope-openid",
    "goauthentik.io/providers/oauth2/scope-profile",
  ]
}

resource "authentik_provider_oauth2" "grafana" {
  name               = "Provider for Grafana"
  authorization_flow = data.authentik_flow.default-provider-authorization-implicit-consent.id
  client_id          = "grafana"
  allowed_redirect_uris = [
    {
      matching_mode = "strict",
      redirect_uri_type = "authorization",
      url           = "https://grafana.mv-angelbachtal.de/login/generic_oauth",
    }
  ]
  signing_key        = data.authentik_certificate_key_pair.generated.id
  invalidation_flow  = data.authentik_flow.default-provider-invalidation-flow.id
  sub_mode           = "user_username"
  property_mappings  = data.authentik_property_mapping_provider_scope.grafana-property-scopes.ids
}

resource "authentik_application" "grafana" {
  name              = "Grafana"
  slug              = "grafana"
  group             = "Monitoring"
  protocol_provider = authentik_provider_oauth2.grafana.id
  meta_launch_url   = "https://grafana.mv-angelbachtal.de"
  open_in_new_tab   = true
  meta_icon         = "grafana.svg"
}

output "application_grafana_uuid" {
  value = authentik_application.grafana.uuid
}
