class AddWorkshopBooleanToEvents < ActiveRecord::Migration[5.0]
  def change
    change_table :events do |t|
      t.boolean  :workshop
      t.boolean  :masterclass
    end
  end
end
