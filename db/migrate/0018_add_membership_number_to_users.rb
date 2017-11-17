class AddMembershipNumberToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :membership_number, :string
  end
end
