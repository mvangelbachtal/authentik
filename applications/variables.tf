variable "authentik_property_mapping_nextcloud_profile_id" {
  type = string
}

variable "music_together_client_id" {
  type    = string
  default = "music-together"
}

variable "music_together_redirect_uri" {
  type    = string
  default = "https://music-together.mv-angelbachtal.de/auth/callback"
}

variable "music_together_launch_url" {
  type    = string
  default = "https://music-together.mv-angelbachtal.de"
}
