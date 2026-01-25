data "authentik_stage" "default-authentication-password" {
  name = "default-authentication-password"
}

data "authentik_stage" "default-authentication-mfa-validation" {
  name = "default-authentication-mfa-validation"
}

data "authentik_stage" "default-authenticator-webauthn-setup" {
  name = "default-authenticator-webauthn-setup"
}

data "authentik_stage" "default-authentication-login" {
  name = "default-authentication-login"
}
