# Provider auth (store as Sensitive Terraform vars in HCP)
variable "client_id"     { type = string }
variable "client_secret" { type = string  sensitive = true }
variable "tenant_id"     { type = string }

# App + directory data (set via tfvars per env)
variable "app_display_name" {
  type        = string
  description = "Display name for the Azure AD App registration."
  default     = "MyApp"
}

variable "users" {
  description = "Users to create in Azure AD."
  type = list(object({
    user_principal_name = string
    display_name        = string
    password            = string
  }))
  default = []
}

variable "groups" {
  description = "Groups to create and their members by UPN."
  type = list(object({
    display_name = string
    description  = optional(string)
    members      = list(string) # list of UPNs
  }))
  default = []
}
