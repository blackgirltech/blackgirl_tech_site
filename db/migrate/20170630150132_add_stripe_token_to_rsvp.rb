class AddStripeTokenToRsvp < ActiveRecord::Migration[5.0]
  def change
    add_column :rsvps, :stripe_token, :string
  end
end
