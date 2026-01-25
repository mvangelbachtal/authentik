data "authentik_property_mapping_provider_scope" "nextcloud-property-scopes" {
  managed_list = [
    "goauthentik.io/providers/oauth2/scope-email",
    "goauthentik.io/providers/oauth2/scope-openid",
    #"goauthentik.io/providers/oauth2/scope-profile"  # TODO: remove if not needed
  ]
}

resource "authentik_provider_oauth2" "nextcloud" {
  name               = "Provider for Nextcloud"
  authorization_flow = data.authentik_flow.default-provider-authorization-implicit-consent.id
  client_id = "nextcloud"
  allowed_redirect_uris = [
    {
      matching_mode = "strict",
      url = "https://cloud.mv-angelbachtal.de/apps/user_oidc/code",
    }
  ]
  signing_key = data.authentik_certificate_key_pair.generated.id
  invalidation_flow = data.authentik_flow.default-provider-invalidation-flow.id
  sub_mode = "user_username"
  property_mappings = concat(
    data.authentik_property_mapping_provider_scope.nextcloud-property-scopes.ids,
    [
      var.authentik_property_mapping_nextcloud_profile_id
    ]
  )
}

resource "authentik_application" "nextcloud" {
  name              = "Nextcloud"
  slug              = "nextcloud"
  group = "Collaboration"
  protocol_provider = authentik_provider_oauth2.nextcloud.id
  meta_launch_url = "https://cloud.mv-angelbachtal.de"
  open_in_new_tab = true
  meta_icon = "/media/public/nextcloud-logo-icon-blue.svg"
}
