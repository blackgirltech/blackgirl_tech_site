class RemoveImageFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :image_file_name, :string
    remove_column :events, :image_content_type, :string
    remove_column :events, :image_file_size, :integer
    remove_column :events, :image_updated_at, :datetime
  end
end
