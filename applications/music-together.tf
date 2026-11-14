data "authentik_property_mapping_provider_scope" "music_together_scopes" {
  managed_list = [
    "goauthentik.io/providers/oauth2/scope-email",
    "goauthentik.io/providers/oauth2/scope-openid",
    "goauthentik.io/providers/oauth2/scope-profile",
  ]
}

resource "authentik_provider_oauth2" "music_together" {
  name               = "Provider for Music Together"
  authorization_flow = data.authentik_flow.default-provider-authorization-implicit-consent.id
  client_id          = var.music_together_client_id
  grant_types        = ["authorization_code"]
  allowed_redirect_uris = [
    {
      matching_mode     = "strict"
      redirect_uri_type = "authorization"
      url               = var.music_together_redirect_uri
    }
  ]
  signing_key       = data.authentik_certificate_key_pair.generated.id
  invalidation_flow = data.authentik_flow.default-provider-invalidation-flow.id
  sub_mode          = "user_email"
  property_mappings = data.authentik_property_mapping_provider_scope.music_together_scopes.ids
}

resource "authentik_application" "music_together" {
  name              = "Music Together"
  slug              = "music-together"
  group             = "Entertainment"
  protocol_provider = authentik_provider_oauth2.music_together.id
  meta_launch_url   = var.music_together_launch_url
  open_in_new_tab   = true
}

