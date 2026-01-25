terraform {
  required_providers {
    authentik = {
      source = "goauthentik/authentik"
    }
  }
}

output "blueprint_ids" {
  value = [
    authentik_blueprint.recovery.id,
    authentik_blueprint.disable-default-brand.id,
  ]
}
