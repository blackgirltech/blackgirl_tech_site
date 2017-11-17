class AddRegularAndOneOffToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :regular, :boolean
    add_column :donations, :one_off, :boolean
  end
end
