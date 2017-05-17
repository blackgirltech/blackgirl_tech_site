class RenameSubscriptionTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :subscriptions, :memberships
  end
end
