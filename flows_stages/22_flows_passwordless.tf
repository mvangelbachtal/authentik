resource "authentik_flow" "passwordless" {
  name          = "passwordless-flow"
  title         = "Passwordless Flow"
  slug          = "passwordless-flow"
  designation   = "authentication"
  authentication = "none"
}

resource "authentik_flow_stage_binding" "passwordless" {
  target = authentik_flow.passwordless.uuid
  stage  = authentik_stage_authenticator_validate.passwordless_webauthn.id
  order  = 10
}

resource "authentik_flow_stage_binding" "authentication-login" {
  target = authentik_flow.passwordless.uuid
  stage  = data.authentik_stage.default-authentication-login.id
  order  = 20
}
