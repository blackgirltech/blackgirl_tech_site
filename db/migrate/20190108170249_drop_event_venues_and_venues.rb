class DropEventVenuesAndVenues < ActiveRecord::Migration[5.2]
  def change
    drop_table :venues
    drop_table :event_venues
  end
end
