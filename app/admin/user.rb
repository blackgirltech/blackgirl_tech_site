ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :volunteer, :admin, :name, :provider, :uid, :subscription_id

  index do
    selectable_column
    id_column
    column :email
    column :volunteer
    column :created_at
    actions
  end

  filter :email
  filter :volunteer
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :volunteer
      f.input :admin
    end
    f.actions
  end

end
