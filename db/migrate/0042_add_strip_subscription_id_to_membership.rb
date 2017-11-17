class AddStripSubscriptionIdToMembership < ActiveRecord::Migration[5.0]
  def change
    add_column :memberships, :stripe_subscription_id, :string
  end
end
