class AddUserIdToSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :user_id, :integer
  end
end
