module "app_registration" {
  source       = "./modules/app_registration"
  display_name = var.app_display_name
}

module "users" {
  source = "./modules/users"
  users  = var.users
}

module "groups" {
  source   = "./modules/groups"
  groups   = var.groups
  user_ids = module.users.user_ids
}
