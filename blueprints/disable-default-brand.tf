resource "authentik_blueprint" "disable-default-brand" {
  name           = "Disable Authentik Default Brand"
  content          = <<-EOT
    version: 1
    metadata:
      name: Disable Authentik Default Brand

    entries:
      - model: authentik_brands.brand
        identifiers:
          domain: authentik-default
        attrs:
          default: false
  EOT
  lifecycle {
    ignore_changes = [content]
  }
}