data "authentik_stage" "default-authenticator-webauthn-setup" {
  name = "default-authenticator-webauthn-setup"
}

resource "authentik_stage_authenticator_validate" "passwordless_webauthn" {
  name                       = "Passwordless WebAuthn"
  device_classes             = ["webauthn"]
  not_configured_action      = "configure" 
  configuration_stages       = [data.authentik_stage.default-authenticator-webauthn-setup.id]
  webauthn_user_verification = "required"
}

output "passwordless_webauthn_stage_id" {
  value = authentik_stage_authenticator_validate.passwordless_webauthn.id
}
