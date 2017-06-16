ActiveAdmin.register Membership do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
# #
  permit_params :membership_type
  menu false
  index do
    selectable_column
    id_column
    column :membership_type
    actions
  end

end
