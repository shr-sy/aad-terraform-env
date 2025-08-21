variable "users" {
  type = list(object({
    user_principal_name = string
    display_name        = string
    mail_nickname       = string
    password            = string
  }))
}
