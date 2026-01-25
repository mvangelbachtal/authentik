module "directory" {
  source = "./directory"
  providers = {
    authentik = authentik

  }
}