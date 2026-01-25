resource "authentik_property_mapping_provider_scope" "nextcloud_profile" {
  name        = "Nextcloud Profile"
  scope_name  = "nextcloud"
  description = "Provides user attributes for Nextcloud"

  expression = <<-EOT
    # Extract all groups the user is a member of
    all_groups = [group.name for group in user.ak_groups.all()]

    # Configure which group names should be exposed to Nextcloud.
    # Edit this list to include only groups you want available in Nextcloud.
    allowed = [
      "Musikverein",
      "Vorstandschaft",
      "Vorstand",
      "Vorsitzende",
      "Jugendvorstand",
      "Jugendvertretung",
      "Jugendbeirat",
      "Außerordentliche Jugendvorstandsmitglieder",
      "Öffentlichkeitsarbeit",
      "Dirigat",
      "Notenverwaltung",
    ]

    # Filter groups to only the allowed set
    groups = [g for g in all_groups if g in allowed]

    # If user is in Nextcloud Admins, ensure the literal "admin" group is present
    if "Nextcloud Admins" in all_groups and "admin" not in groups:
      groups.append("admin")

    # Extract phone number from nested `contact` attribute if present
    phone = None
    contact = user.attributes.get("contact", None)
    if isinstance(contact, dict):
      phone = contact.get("phone_number", None)
    elif contact:
      # If contact is a plain string, use it directly
      phone = contact

    return {
      "name": request.user.name,
      "groups": groups,
      "quota": user.group_attributes().get("nextcloud_quota", None),
      "role": user.attributes.get("role", None),
      "organisation": user.group_attributes().get("organisation", None),
      "phone_number": phone,
    }
  EOT
}

output "authentik_property_mapping_nextcloud_profile_id" {
  value = authentik_property_mapping_provider_scope.nextcloud_profile.id
}
