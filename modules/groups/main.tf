resource "azuread_group" "this" {
  for_each     = { for g in var.groups : g.display_name => g }
  display_name = each.value.display_name
  description  = lookup(each.value, "description", null)
}

resource "azuread_group_member" "members" {
  for_each = {
    for g in var.groups : g.display_name => g.members
  }

  group_object_id  = azuread_group.this[each.key].id
  member_object_id = var.user_ids[each.value[0]]
}
