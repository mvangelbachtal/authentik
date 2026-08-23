resource "authentik_group" "GrafanaAdmins" {
  name = "Grafana Admins"
}

resource "authentik_group" "GrafanaEditors" {
  name = "Grafana Editors"
}

resource "authentik_group" "GrafanaViewers" {
  name = "Grafana Viewers"
}

output "group_grafana_admins_id" {
  value = authentik_group.GrafanaAdmins.id
}

output "group_grafana_editors_id" {
  value = authentik_group.GrafanaEditors.id
}

output "group_grafana_viewers_id" {
  value = authentik_group.GrafanaViewers.id
}
