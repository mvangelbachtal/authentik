module "authenticator_validate_stages" {
  source = "./authenticator_validate_stages"
}

output "passwordless_webauthn_stage_id" {
  value = module.authenticator_validate_stages.passwordless_webauthn_stage_id
}