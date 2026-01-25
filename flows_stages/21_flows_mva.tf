resource "authentik_flow" "mva" {
  name          = "mva-authentication-flow"
  title         = "MVA Authentication Flow"
  slug          = "mva-authentication-flow"
  designation   = "authentication"
  authentication = "none"
}

resource "authentik_flow_stage_binding" "mva-identification" {
  target = authentik_flow.mva.uuid
  stage  = authentik_stage_identification.passwordless.id
  order  = 10
}

resource "authentik_flow_stage_binding" "mva-password" {
  target = authentik_flow.mva.uuid
  stage = data.authentik_stage.default-authentication-password.id
  order  = 20
}

resource "authentik_flow_stage_binding" "mva-mfa-validation" {
  target = authentik_flow.mva.uuid
  stage = data.authentik_stage.default-authentication-mfa-validation.id
  order  = 30
}

resource "authentik_flow_stage_binding" "mva-login" {
  target = authentik_flow.mva.uuid
  stage = data.authentik_stage.default-authentication-login.id
  order  = 100
}

output "authentik_flow_mva_uuid" {
  value = authentik_flow.mva.uuid
}
