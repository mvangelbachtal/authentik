resource "authentik_stage_prompt_field" "settings_locale" {
  name       = "settings-locale"
  field_key = "attributes.settings.locale"

  label     = "Locale"
  type      = "ak-locale"
  order     = 203

  placeholder = "Locale"

  initial_value = <<-EOT
    try:
        return user.attributes.get("settings", {}).get("locale", "")
    except:
        return ''
  EOT

  initial_value_expression = true
}

resource "authentik_stage_prompt_field" "settings_phone" {
  name       = "settings-phone"
  field_key = "attributes.contact.phone_number"

  label    = "Phone number"
  type     = "text"
  order    = 230

  placeholder = "+49 123 4567890"

  initial_value = <<-EOT
    try:
        return user.attributes.get("contact", {}).get("phone_number", "")
    except:
        return ''
  EOT

  initial_value_expression = true
}

resource "authentik_stage_prompt_field" "settings_street" {
  name       = "settings-street"
  field_key = "street_address"
  label     = "Street address"
  type      = "text"
  order     = 5
}

resource "authentik_stage_prompt_field" "settings_postal_code" {
  name       = "settings-postal-code"
  field_key = "postal_code"
  label     = "Postal code"
  type      = "text"
  order     = 6
}

resource "authentik_stage_prompt_field" "settings_locality" {
  name       = "settings-locality"
  field_key = "locality"
  label     = "City / Locality"
  type      = "text"
  order     = 7
}

resource "authentik_stage_prompt_field" "settings_region" {
  name       = "settings-region"
  field_key = "region"
  label     = "Region / State"
  type      = "text"
  order     = 8
}

resource "authentik_stage_prompt_field" "settings_country" {
  name       = "settings-country"
  field_key = "country"
  label     = "Country"
  type      = "text"
  order     = 9
}

resource "authentik_stage_prompt_field" "settings_website" {
  name       = "settings-website"
  field_key = "website"
  label     = "Website"
  type      = "text"
  order     = 10
}

resource "authentik_stage_prompt_field" "settings_fediverse" {
  name       = "settings-fediverse"
  field_key = "fediverse"
  label     = "Fediverse handle"
  type      = "text"
  order     = 11
}

resource "authentik_stage_prompt" "settings_prompt" {
  name = "User settings prompt"

  fields = [
    authentik_stage_prompt_field.settings_locale.id,
    authentik_stage_prompt_field.settings_phone.id,
  ]
}
