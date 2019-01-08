class DropSkillsAndMemberSkills < ActiveRecord::Migration[5.2]
  def change
    drop_table :skills
    drop_table :member_skills
  end
end
