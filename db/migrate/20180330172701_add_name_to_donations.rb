class AddNameToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :name, :string
  end
end
