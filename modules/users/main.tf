resource "azuread_user" "this" {
  for_each             = { for u in var.users : u.user_principal_name => u }
  user_principal_name  = each.value.user_principal_name
  display_name         = each.value.display_name
  mail_nickname        = each.value.mail_nickname
  password             = each.value.password
  force_password_change = true
}

output "user_ids" {
  value = { for k, u in azuread_user.this : k => u.id }
}
