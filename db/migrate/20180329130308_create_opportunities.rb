class CreateOpportunities < ActiveRecord::Migration[5.0]
  def change
    create_table :opportunities do |t|
      t.string :name
      t.string :company
      t.text :description
      t.text :company_bio
      t.datetime :deadline

      t.timestamps
    end
  end
end
