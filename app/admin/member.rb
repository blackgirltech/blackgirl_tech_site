ActiveAdmin.register Member do

  permit_params :email, :password, :password_confirmation, :volunteer, :admin, :first_name, :last_name, :provider, :uid, :membership_id, :city, :postcode, :address_line_one, :address_line_two

  index do
    selectable_column
    id_column
    column :email
    column :volunteer
    column :membership do |member|
      if member.membership.present?
        member.membership.membership_type
      end
    end
    column :created_at
    actions
  end

  filter :email
  filter :volunteer
  filter :membership
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :membership, as: :select, collection: Membership.all.map {|su| [su.membership_type, su.id]}
      f.input :volunteer
      f.input :admin
    end
    f.actions
  end

end
