class AddExternalToOpportunity < ActiveRecord::Migration[5.2]
  def change
    add_column :opportunities, :external, :boolean, default: false
  end
end
