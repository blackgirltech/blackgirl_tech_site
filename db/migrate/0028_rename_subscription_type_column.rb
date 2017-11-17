class RenameSubscriptionTypeColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :memberships, :subscription_type, :membership_type
  end
end
