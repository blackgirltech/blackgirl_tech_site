class AddStripeSubscriptionIdToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :stripe_subscription_id, :string
  end
end
