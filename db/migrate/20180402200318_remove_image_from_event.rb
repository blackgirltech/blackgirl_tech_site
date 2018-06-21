class RemoveImageFromEvent < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :image, :string
  end
end
