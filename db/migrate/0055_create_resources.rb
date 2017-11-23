class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :title
      t.text :preview_description
      t.text :description
      t.string :external_url
    end
  end
end
