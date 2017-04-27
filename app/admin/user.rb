ActiveAdmin.register User do

  permit_params :email, :password, :password_confirmation, :volunteer, :admin, :first_name, :last_name, :provider, :uid, :subscription_id, :city, :postcode, :address_line_one, :address_line_two

  index do
    selectable_column
    id_column
    column :email
    column :volunteer
    column :subscription do |user|
      if user.subscription.present?
        user.subscription.subscription_type
      end
    end
    column :created_at
    actions
  end

  filter :email
  filter :volunteer
  filter :subscription
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :subscription, as: :select, collection: Subscription.all.map {|su| [su.subscription_type, su.id]}
      f.input :volunteer
      f.input :admin
    end
    f.actions
  end

end
