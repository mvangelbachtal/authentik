module "applications" {
  source = "./applications"
  providers = {
    authentik = authentik
  }
  authentik_property_mapping_nextcloud_profile_id = module.customization.authentik_property_mapping_nextcloud_profile_id
  music_together_redirect_uri                     = "https://music-together.mv-angelbachtal.de/auth/callback"
  music_together_launch_url                       = "https://music-together.mv-angelbachtal.de"
}
