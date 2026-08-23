module "customization" {
  source = "./customization"
  providers = {
    authentik = authentik
  }
  application_grafana_uuid     = module.applications.application_grafana_uuid
  group_grafana_admins_id    = module.directory.group_grafana_admins_id
  group_grafana_editors_id   = module.directory.group_grafana_editors_id
  group_grafana_viewers_id   = module.directory.group_grafana_viewers_id
}