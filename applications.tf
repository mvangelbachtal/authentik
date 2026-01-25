module "applications" {
  source = "./applications"
  providers = {
    authentik = authentik
  }
  authentik_property_mapping_nextcloud_profile_id = module.customization.authentik_property_mapping_nextcloud_profile_id
}
