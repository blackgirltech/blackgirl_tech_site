class MemberSkill < ApplicationRecord
  belongs_to :skill, optional: true
  belongs_to :member, optional: true
end
