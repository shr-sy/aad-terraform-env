variable "groups" {
  type = list(object({
    display_name = string
    description  = optional(string)
    members      = list(string) # user principal names
  }))
}

variable "user_ids" {
  type = map(string)
}
