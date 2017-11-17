class DropMemberships < ActiveRecord::Migration[5.0]
  def change
    drop_table :memberships
  end
end
