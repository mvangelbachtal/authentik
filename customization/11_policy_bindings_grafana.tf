resource "authentik_policy_binding" "grafana_admin_access" {
  target  = var.application_grafana_uuid
  group   = var.group_grafana_admins_id
  order   = 0
  enabled = true
}

resource "authentik_policy_binding" "grafana_editor_access" {
  target  = var.application_grafana_uuid
  group   = var.group_grafana_editors_id
  order   = 1
  enabled = true
}

resource "authentik_policy_binding" "grafana_viewer_access" {
  target  = var.application_grafana_uuid
  group   = var.group_grafana_viewers_id
  order   = 2
  enabled = true
}
