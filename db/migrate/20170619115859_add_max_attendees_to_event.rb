class AddMaxAttendeesToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :max_attendees, :integer
    add_column :events, :max_volunteers, :integer
  end
end
