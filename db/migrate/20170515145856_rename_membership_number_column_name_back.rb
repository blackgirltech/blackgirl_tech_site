class RenameMembershipNumberColumnNameBack < ActiveRecord::Migration[5.0]
  def change
    rename_column :subscriptions, :subscription_number, :membership_number
  end
end
