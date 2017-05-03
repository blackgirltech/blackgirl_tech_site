ActiveAdmin.register Subscription do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :subscription_type

  index do
    selectable_column
    id_column
    column :subscription_type
    actions
  end

end
