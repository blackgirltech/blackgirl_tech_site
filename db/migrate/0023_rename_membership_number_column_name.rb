class RenameMembershipNumberColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :subscriptions, :membership_number, :subscription_number
  end
end
