class AddMembershipNumberToSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :membership_number, :string
  end
end
