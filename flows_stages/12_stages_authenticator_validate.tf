resource "authentik_stage_authenticator_validate" "passwordless_webauthn" {
  name                       = "Passwordless WebAuthn"
  device_classes             = ["webauthn"]
  not_configured_action      = "configure" 
  configuration_stages       = [data.authentik_stage.default-authenticator-webauthn-setup.id]
  webauthn_user_verification = "required"
}
