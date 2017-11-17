class CreateRsvps < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvps do |t|
      t.integer :event_id
      t.integer :member_id
      t.boolean :attending
      t.timestamps
    end
  end
end
