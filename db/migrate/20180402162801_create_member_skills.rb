class CreateMemberSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :member_skills do |t|
      t.integer :skill_id
      t.integer :member_id
    end
  end
end
