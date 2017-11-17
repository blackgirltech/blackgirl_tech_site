class RemoveMembershipNumberFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :membership_number, :string
  end
end
