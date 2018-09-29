class AddNotesToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :notes, :text
  end
end
