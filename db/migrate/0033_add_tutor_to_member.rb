class AddTutorToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :tutor, :boolean
  end
end
