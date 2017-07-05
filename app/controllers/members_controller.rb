class MembersController < ApplicationController

  def show
    @member = current_member
    @membership = @member.most_recent_membership
  end
end
