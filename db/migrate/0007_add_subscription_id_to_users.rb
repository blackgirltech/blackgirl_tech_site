class AddSubscriptionIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :subscription_id, :integer
  end
end
