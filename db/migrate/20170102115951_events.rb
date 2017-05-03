class Events < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string   "name"
      t.date     "date"
      t.time     "time"
      t.text     "address"
      t.text     "details"
      t.string   "image"
      t.string   "url"      
      t.timestamps null: false
    end
  end
end
