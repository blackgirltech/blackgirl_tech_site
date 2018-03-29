class AddBwToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :black_woman_nbp, :boolean, default: false
  end
end
