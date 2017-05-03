class AddMandateAndCustomerToSubscription < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :gc_mandate_id, :string
    add_column :subscriptions, :gc_customer_id, :string
  end
end
