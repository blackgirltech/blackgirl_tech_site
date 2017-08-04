class AddStripeCustomerIdToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :stripe_customer_id, :string
  end
end
