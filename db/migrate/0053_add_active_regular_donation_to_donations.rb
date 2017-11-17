class AddActiveRegularDonationToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :active_regular_donation, :boolean, default: false
  end
end
