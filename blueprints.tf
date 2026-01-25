module "blueprints" {
  source = "./blueprints"
  providers = {
    authentik = authentik
  }
}

output "blueprint_ids" {
  value = module.blueprints.blueprint_ids
}
