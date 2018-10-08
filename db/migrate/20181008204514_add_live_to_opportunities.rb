class AddLiveToOpportunities < ActiveRecord::Migration[5.2]
  def change
    add_column :opportunities, :live, :boolean, default: false
  end
end
