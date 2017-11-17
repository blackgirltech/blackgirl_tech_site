class AddVolunteeringToRsvp < ActiveRecord::Migration[5.0]
  def change
    add_column :rsvps, :volunteering, :boolean
  end
end
