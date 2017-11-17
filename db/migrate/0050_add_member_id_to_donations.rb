class AddMemberIdToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :member_id, :integer
  end
end
