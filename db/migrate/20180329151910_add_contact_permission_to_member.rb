class AddContactPermissionToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :contact_permission, :boolean
  end
end
