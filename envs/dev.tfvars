app_display_name = "Dev-App"

users = [
  { user_principal_name = "devuser1@yourtenant.onmicrosoft.com",  display_name = "Dev User One",  password = "DevP@ssword123!" },
  { user_principal_name = "devadmin1@yourtenant.onmicrosoft.com", display_name = "Dev Admin One", password = "DevAdminP@ssword123!" }
]

groups = [
  { display_name = "DevAppUsers",  description = "Developers application users",  members = ["devuser1@yourtenant.onmicrosoft.com"] },
  { display_name = "DevAppAdmins", description = "Developers application admins", members = ["devadmin1@yourtenant.onmicrosoft.com"] }
]
