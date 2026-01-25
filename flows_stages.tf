module "flows_stages" {
  source = "./flows_stages"
  providers = {
    authentik = authentik
  }
}