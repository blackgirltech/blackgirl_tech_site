class Skill < ApplicationRecord
  has_many :member_skills
  has_many :members, through: :member_skills
end
