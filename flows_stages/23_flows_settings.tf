resource "authentik_flow" "user_settings" {
  name          = "User settings flow"
  title         = "User settings"
  slug          = "user-settings"
  designation   = "stage_configuration"
  authentication = "require_authenticated"
}

resource "authentik_flow_stage_binding" "user_settings_prompt_binding" {
  target = authentik_flow.user_settings.uuid
  stage  = authentik_stage_prompt.settings_prompt.id
  order  = 10
}

resource "authentik_flow_stage_binding" "user_settings_user_write_binding" {
  target = authentik_flow.user_settings.uuid
  stage  = authentik_stage_user_write.settings_user_write.id
  order  = 20
}

output "authentik_flow_user_settings_uuid" {
  value = authentik_flow.user_settings.uuid
}
