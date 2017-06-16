class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :contact_name
      t.string :contact_email
      t.timestamps
    end
  end
end
