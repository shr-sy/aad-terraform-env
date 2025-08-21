variable "groups" {
  type = list(object({
    display_name = string
    description  = optional(string)
    members      = list(string)
  }))
  default = []
}

variable "user_ids" {
  type        = map(string)
  description = "Map of UPN -> object ID from users module."
  default     = {}
}

resource "azuread_group" "this" {
  for_each         = { for g in var.groups : g.display_name => g }
  display_name     = each.value.display_name
  description      = try(each.value.description, null)
  security_enabled = true

  # Resolve member UPNs to object IDs
  members          = [for upn in each.value.members : var.user_ids[upn]]
}

output "group_ids" {
  value = { for name, g in azuread_group.this : name => g.id }
}
