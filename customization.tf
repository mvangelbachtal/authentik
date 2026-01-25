module "customization" {
  source = "./customization"
  providers = {
    authentik = authentik
  }
}