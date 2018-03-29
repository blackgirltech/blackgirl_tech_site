class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.text :cover_letter
      t.string :code_test_url
      t.boolean :longlist
      t.boolean :shortlist
      t.boolean :finalist
      t.boolean :awarded
      t.integer :opportunity_id
      t.integer :member_id

      t.timestamps
    end
  end
end
