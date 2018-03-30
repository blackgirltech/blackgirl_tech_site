class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.text :cover_letter
      t.string :code_test_url
      t.boolean :longlist, default: false
      t.boolean :shortlist, default: false
      t.boolean :finalist, default: false
      t.boolean :awarded, default: false
      t.boolean :moderated, default: false
      t.integer :opportunity_id
      t.integer :member_id

      t.timestamps
    end
  end
end
