resource "authentik_stage_user_write" "settings_user_write" {
  name = "User settings write"
  user_creation_mode = "never_create"
}