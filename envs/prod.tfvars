app_display_name = "Prod-App"

users = [
  { user_principal_name = "produser1@yourtenant.onmicrosoft.com",  display_name = "Prod User One",  password = "ProdP@ssword123!" },
  { user_principal_name = "prodadmin1@yourtenant.onmicrosoft.com", display_name = "Prod Admin One", password = "ProdAdminP@ssword123!" }
]

groups = [
  { display_name = "ProdAppUsers",  description = "Production application users",  members = ["produser1@yourtenant.onmicrosoft.com"] },
  { display_name = "ProdAppAdmins", description = "Production application admins", members = ["prodadmin1@yourtenant.onmicrosoft.com"] }
]
