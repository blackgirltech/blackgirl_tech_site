class AddUrlToOpportunity < ActiveRecord::Migration[5.0]
  def change
    add_column :opportunities, :url, :string
  end
end
