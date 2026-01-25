module "brands" {
  source = "./brands"
  providers = {
    authentik = authentik
  }

  depends_on = [
    module.blueprints,
  ]

  authentik_flow_mva_uuid = module.flows_stages.authentik_flow_mva_uuid
  authentik_flow_user_settings_uuid = module.flows_stages.authentik_flow_user_settings_uuid
}