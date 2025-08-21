variable "users" {
  type = list(object({
    user_principal_name = string
    display_name        = string
    password            = string
  }))
  default = []
}

resource "azuread_user" "this" {
  for_each = { for u in var.users : u.user_principal_name => u }

  user_principal_name  = each.value.user_principal_name
  display_name         = each.value.display_name
  mail_nickname        = replace(each.value.user_principal_name, "@.*$", "")
  password             = each.value.password
  force_password_change = true # ✅ updated attribute name
}

output "user_ids" {
  value = { for upn, u in azuread_user.this : upn => u.id }
}
