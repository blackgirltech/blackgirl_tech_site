class AddStripeChargeTokenToRsvps < ActiveRecord::Migration[5.0]
  def change
    add_column :rsvps, :stripe_charge_token, :string
  end
end
