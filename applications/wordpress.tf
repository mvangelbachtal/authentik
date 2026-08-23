data "authentik_property_mapping_provider_scope" "wordpress-property-scopes" {
  managed_list = [
    "goauthentik.io/providers/oauth2/scope-email",
    "goauthentik.io/providers/oauth2/scope-openid",
    "goauthentik.io/providers/oauth2/scope-profile",
    "goauthentik.io/providers/oauth2/scope-offline_access",
  ]
}

resource "authentik_provider_oauth2" "wordpress" {
  name               = "Provider for WordPress"
  authorization_flow = data.authentik_flow.default-provider-authorization-implicit-consent.id
  client_id = "wordpress"
  allowed_redirect_uris = [
    {
      matching_mode = "strict",
      redirect_uri_type = "authorization",
      url = "https://www.mv-angelbachtal.de/wp-admin/admin-ajax.php?action=openid-connect-authorize",
    }
  ]
  signing_key = data.authentik_certificate_key_pair.generated.id
  invalidation_flow = data.authentik_flow.default-provider-invalidation-flow.id
  sub_mode = "user_username"
  property_mappings = data.authentik_property_mapping_provider_scope.wordpress-property-scopes.ids
}

resource "authentik_application" "wordpress" {
  name              = "Website"
  slug              = "wordpress"
  group = "Websites"
  protocol_provider = authentik_provider_oauth2.wordpress.id
  meta_launch_url = "https://www.mv-angelbachtal.de/wp-login.php"
  open_in_new_tab = true
  meta_icon = "wordpress.svg"
}

resource "authentik_provider_oauth2" "wordpress-staging" {
  name               = "Provider for WordPress Staging"
  authorization_flow = data.authentik_flow.default-provider-authorization-implicit-consent.id
  client_id = "wordpress-staging"
  allowed_redirect_uris = [
    {
      matching_mode = "strict",
      redirect_uri_type = "authorization",
      url = "https://staging.mv-angelbachtal.de/wp-admin/admin-ajax.php?action=openid-connect-authorize",
    }
  ]
  signing_key = data.authentik_certificate_key_pair.generated.id
  invalidation_flow = data.authentik_flow.default-provider-invalidation-flow.id
  sub_mode = "user_username"
  property_mappings = data.authentik_property_mapping_provider_scope.wordpress-property-scopes.ids
}

resource "authentik_application" "wordpress-staging" {
  name              = "Website Staging"
  slug              = "wordpress-staging"
  group = "Websites"
  protocol_provider = authentik_provider_oauth2.wordpress-staging.id
  meta_launch_url = "https://staging.mv-angelbachtal.de/wp-login.php"
  open_in_new_tab = true
  meta_icon = "wordpress-stage.svg"
}
