data "authentik_flow" "recovery" {
  slug = "default-recovery-flow"
}

resource "authentik_brand" "mv_angelbachtal" {
  domain           = "mv-angelbachtal.de"
  default          = true
  branding_title   = "Musikverein Angelbachtal e.V."
  branding_logo    = "/media/public/mva.svg"
  branding_favicon = "/static/dist/assets/icons/icon.png"
  flow_authentication = var.authentik_flow_mva_uuid
  flow_recovery = data.authentik_flow.recovery.id
  flow_user_settings = var.authentik_flow_user_settings_uuid
}