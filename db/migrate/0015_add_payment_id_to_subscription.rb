class AddPaymentIdToSubscription < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :gc_payment_id, :string
  end
end
