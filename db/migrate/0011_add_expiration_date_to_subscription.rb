class AddExpirationDateToSubscription < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :expiration_date, :datetime
  end
end
