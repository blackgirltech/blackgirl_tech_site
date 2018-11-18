class DropUnusedTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :event_venues
    drop_table :member_skills
    drop_table :sessions
    drop_table :skills
    drop_table :venues
  end
end
