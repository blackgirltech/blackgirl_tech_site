class AddStripeTokenToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :stripe_token, :string
  end
end
