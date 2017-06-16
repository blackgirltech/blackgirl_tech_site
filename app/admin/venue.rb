ActiveAdmin.register Venue do

  permit_params :name, :contact_name, :contact_email, :address

  filter :name
  filter :contact_name
  filter :contact_email

end
