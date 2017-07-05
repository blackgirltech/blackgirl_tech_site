class AddCheckedInToRsvps < ActiveRecord::Migration[5.0]
  def change
    add_column :rsvps, :checked_in, :boolean
  end
end
