# App + directory data (set via tfvars per env)
variable "app_display_name" {
  type        = string
  description = "Display name for the Azure AD App registration."
  default     = "MyApp"
}

variable "users" {
  description = "List of users to create in Azure AD"
  type = list(object({
    user_principal_name = string
    display_name        = string
    mail_nickname       = string
    password            = string
  }))
  default = []
}

variable "groups" {
  description = "List of groups to create in Azure AD"
  type = list(object({
    display_name = string
    description  = optional(string)
    members      = list(string) # user principal names
  }))
  default = []
}

