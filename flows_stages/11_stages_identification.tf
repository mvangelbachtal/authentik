resource "authentik_stage_identification" "passwordless" {
  name           = "authentication-identification-passwordless"
  user_fields    = ["username", "email"]
  case_insensitive_matching = true
  passwordless_flow = authentik_flow.passwordless.uuid
}