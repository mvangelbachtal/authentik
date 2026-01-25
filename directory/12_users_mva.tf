locals {
  users_file = "${path.module}/../env/users/mva.yaml"

  users_list = yamldecode(file(local.users_file))

  # Ensure username and email defaults per user, then convert to map keyed by username
  users_with_defaults = [for u in local.users_list :
    merge(u, {
      username = replace(replace(replace(replace(
        lower(lookup(u, "username",
          lower(format("%s.%s",
            substr(element(regexall("\\S+", lookup(u, "name", "")), 0), 0, 1),
            element(regexall("\\S+", lookup(u, "name", "")), length(regexall("\\S+", lookup(u, "name", ""))) - 1)
          ))
        )), "ä", "ae"), "ö", "oe"), "ü", "ue"), "ß", "ss"),
      email = lookup(u, "email", format("%s@mv-angelbachtal.de",
        replace(replace(replace(replace(
          lower(lookup(u, "username",
            lower(format("%s.%s",
              substr(element(regexall("\\S+", lookup(u, "name", "")), 0), 0, 1),
              element(regexall("\\S+", lookup(u, "name", "")), length(regexall("\\S+", lookup(u, "name", ""))) - 1)
            ))
          )), "ä", "ae"), "ö", "oe"), "ü", "ue"), "ß", "ss")
      ))
    })
  ]

  users = { for u in local.users_with_defaults : u.username => u }

}

resource "authentik_user" "from_yaml" {
  for_each = local.users

  username = each.value.username
  name     = each.value.name
  email    = each.value.email

  groups = [for g in lookup(each.value, "groups", []) : lookup(local.group_key_to_id, g, lookup(local.group_name_to_id, g, null))]

  attributes = jsonencode(lookup(each.value, "attributes", {}))

  lifecycle {
    ignore_changes = [
      attributes,
    ]
  }
}